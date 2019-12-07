#include "itimer_handler.h"
#include "iutil.h"
#include "ithread.h"
#include "itimer_scheduler.h"
#include "ievent_reactor.h"
#include "iread_handler.h"
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/socket.h>
#include "ibuffer.h"
#include "iexecutable.h"
#include "iioevent_handler.h"
#include <cstring>
#include <cerrno>
#include <iostream>
#include <fcntl.h>

using namespace std;

int server(const char *ip, int port)
{
  int                 fd;
  in_addr_t           ipaddr;
  struct sockaddr_in  inaddr;

  memset(&inaddr, 0, sizeof(inaddr));
  if ((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
    std::cerr << "ERROR socket() failed" << std::endl;
    return -1;
  }
  ipaddr = inet_addr(ip);
  inaddr.sin_family = AF_INET;
  inaddr.sin_port = htons(port);
  inaddr.sin_addr.s_addr = ipaddr;

  int n = 1;
  if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &n, sizeof(n)) < 0) {
    std::cerr << "ERROR setsockopt failed " << strerror(errno) << std::endl;
    return -1;
  }

  if (bind(fd, (struct sockaddr *)&inaddr, sizeof(inaddr)) < 0) {
    std::cerr << "ERROR bind() failed " << std::endl;
    return -1;
  }

  if (fcntl(fd, F_SETFL, O_NONBLOCK) < 0) {
    std::cerr << "ERROR syscall fcntl " << strerror(errno) << std::endl;
    return -1;
  }

  if (listen(fd, 20) < 0) {
    std::cerr << "ERROR listen() failed " << std::endl;
    return -1;
  }

  return fd;
}

class IReadExecute : public IExecutable {
public:
  virtual void execute(void *_argument);
};

void IReadExecute::execute(void *_argument)
{
  ssize_t _num_read;
  char _buf[2048] = { 0 };
  IIOEventHandler *_ioev_handler;

  _ioev_handler = (IIOEventHandler *)_argument;
  if (_ioev_handler == NULL)
    return ;

  _num_read = _ioev_handler->read(_buf, sizeof(_buf));
  if (_num_read == 0) {
    delete _ioev_handler;
    return ;
  }
  _ioev_handler->write(_buf, _num_read);
}

class IListenerHandler : public IReadHandler {
public:
  IListenerHandler(int fd, IEventReactor *pReactor)
    : IReadHandler(fd, pReactor)
  { }

  virtual void run() 
  {
    std::cout << "IListenerHandler::run() " << std::endl;
    IReadExecute *    _read_exec = NULL;
    IIOEventHandler * _ioev_handler = NULL;
    int               _handler_type;

    _handler_type = IHandlerType::IHNDL_READ;
    do {
      int connfd = accept(fd(), NULL, NULL);
      if (connfd > 0) {
        std::cout << "get an connect " << connfd << std::endl;
        _read_exec = new IReadExecute;
        _ioev_handler = new IIOEventHandler(connfd, reactor());
        _ioev_handler->set_exec(_read_exec, NULL, NULL);
        _ioev_handler->enable(_handler_type);
      }
      else {
        break;
      }
    } while (1);
    std::cout << "IListenerHandler::run() end " << std::endl;
  }
};

int main(int argc, char *argv[])
{
  IListenerHandler *  _l;
  IEventReactor *     _r;
  int _listen_fd = server("127.0.0.1", 2222);
  _r = new IEventReactor;
  _l = new IListenerHandler(_listen_fd, _r);
  _r->schedule(_l, NULL);
  _r->runEventLoop();
  return 0;
}

