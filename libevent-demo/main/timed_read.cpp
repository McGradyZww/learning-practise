#include "itimer_handler.h"
#include "iutil.h"
#include "itimer_scheduler.h"
#include "ievent_reactor.h"
#include "iread_handler.h"
#include <iostream>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/socket.h>
#include "ibuffer.h"

using namespace std;

int server(const char *ip, int port)
{
  int                 fd;
  in_addr_t           ipaddr;
  struct sockaddr_in  inaddr;

  memset(&inaddr, 0, sizeof(inaddr));
  if ((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
    std::cerr << "socket() failed" << std::endl;
    return -1;
  }
  ipaddr = inet_addr(ip);
  inaddr.sin_family = AF_INET;
  inaddr.sin_port = htons(port);
  inaddr.sin_addr.s_addr = ipaddr;

  int n = 1;
  if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &n, sizeof(n)) < 0) {
    std::cerr << "setsockopt failed " << strerror(errno) << std::endl;
    return -1;
  }

  if (bind(fd, (struct sockaddr *)&inaddr, sizeof(inaddr)) < 0) {
    std::cerr << "bind() failed " << std::endl;
    return -1;
  }

  if (listen(fd, 20) < 0) {
    std::cerr << "listen() failed " << std::endl;
    return -1;
  }

  return fd;
}

class ICommonReadTimer : public ITimerHandler {
public:
  ICommonReadTimer(IEventReactor *r) : ITimerHandler(r) { }

  virtual void run() {
    if (m_pExec != NULL) {
      m_pExec->execute(this);
    }
  }
};

class ICommonWriteHandler : public IWriteHandler {
public:
  ICommonWriteHandler(int fd, IEventReactor *pReactor)
    : IWriteHandler(fd, pReactor)
  {
    _M_buffer = new IEventBuffer;
  }
  virtual void run() {
    if (_M_buffer->size() != 0) {
      _M_buffer->write(fd(), _M_buffer->size());
    }

    if (_M_buffer->size() == 0) {
      m_pReactor->cancel(this);
    }
  }

  void send(const char *_buf, size_t _size) {
    _M_buffer->read(_buf, _size);
    m_pReactor->schedule(this);
  }

private:
  IEventBuffer * _M_buffer;
};

class ICommonReadHandler : public IReadHandler {
private:
  IEventBuffer * _M_buffer;
public:
  ICommonReadHandler(int fd, IEventReactor *pReactor)
    : IReadHandler(fd, pReactor)
  {
    _M_buffer = new IEventBuffer;
  }

  virtual void run();
};

void ICommonReadHandler::run() {
  char buf[1024];
  ssize_t _n_read = _M_buffer->read(fd(), 1024);
  if (_n_read == 0) {
    (void)close(fd());
    m_pReactor->cancel(fd(), IHandlerType::IHNDL_WRITE);
    m_pReactor->cancel(fd(), IHandlerType::IHNDL_READ);
    cout << "close fd " << fd() << endl;
    return ;
  }
  cout << _n_read << " bytes read from " << fd() << endl;
  _M_buffer->write(buf, _n_read);
  std::cout << buf << std::endl;
  ICommonWriteHandler *_w = new ICommonWriteHandler(fd(), m_pReactor);
  m_pReactor->schedule(_w);
  _w->send(buf, _n_read);
}

class IListenerHandler : public IReadHandler {
public:
  IListenerHandler(int fd, IEventReactor *pReactor)
    : IReadHandler(fd, pReactor)
  { }

  virtual void run() {
    do {
      int connfd = accept(fd(), NULL, NULL);
      if (connfd > 0) {
        std::cout << "get an connect " << connfd << std::endl;
        ICommonReadHandler *p = new ICommonReadHandler(connfd, reactor());
        reactor()->schedule(p);
      }
      else {
        break;
      }
    } while (0);
  }
};

class IEchoService {
private:
  ICommonReadHandler  * _M_read_handler;
  ICommonWriteHandler * _M_write_handler;

public:
  IEchoService(int _fd, IEventReactor *_r) {
    _M_read_handler = new ICommonReadHandler(_fd, _r);
    _M_write_handler = new ICommonWriteHandler(_fd, _r);
  }
};


class ITimedReadExecute : public IExecutable {
public:
  ITimedReadExecute(ICommonReadHandler *rhandler, ICommonReadTimer *rtimer);
  virtual void execute(void *arg) {
    int fd = m_pReadHandler->fd();
    if (arg == (void *)m_pReadHandler) {
      
    }
  }

private:
  ICommonReadHandler *m_pReadHandler;
  ICommonReadTimer   *m_pTimerHandler;
};


int main(int argc, char *argv[])
{
  IEventReactor *r = new IEventReactor;
  int fd = server("127.0.0.1", 2222);

  IListenerHandler *l = new IListenerHandler(fd, r);

  r->schedule(l);

  r->runEventLoop();
  return 0;
}


