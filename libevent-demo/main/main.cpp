#include "itimer_handler.h"
#include "iutil.h"
#include "itimer_scheduler.h"
#include "ievent_reactor.h"
#include "iread_handler.h"
#include <iostream>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/socket.h>

using namespace std;

class HelloTimer : public ITimerHandler {
public:
  HelloTimer(IEventReactor *p) : ITimerHandler(p) { }

  virtual void run() {
    cout << "Hello Timer " << endl;
  }
};

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

  if (bind(fd, (struct sockaddr *)&inaddr, sizeof(inaddr)) < 0) {
    std::cerr << "bind() failed " << std::endl;
    return -1;
  }
  
  if (listen(fd, 20) < 0) {
    std::cerr << "listen() failed " << std::endl;
    return false;
  }

  return fd;
}

class ICommonReadHandler : public IReadHandler {
public:
  ICommonReadHandler(int fd, IEventReactor *pReactor)
    : IReadHandler(fd, pReactor)
  { }
  virtual void run() 
  {
    ssize_t nreads;
    do {
      memset(buf, 0, sizeof(buf));
      nreads = read(fd(), buf, sizeof(buf));
      if (nreads > 0)
        (void)write(STDOUT_FILENO, buf, nreads);
      else {
        std::cout << "close connfd " << fd() << std::endl;
        (void)close(fd());
        reactor()->cancel(this);
      }
    } while (0);
  }

private:
  char buf[1024];
};

class IListenerHandler : public IReadHandler {
public:
  IListenerHandler(int fd, IEventReactor *pReactor)
    : IReadHandler(fd, pReactor)
  { }

  virtual void run() 
  {
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

int main(int argc, char *argv[])
{
  struct timeval tv;
  tv.tv_sec = 2;
  tv.tv_usec = 200000;
  IEventReactor *p = new IEventReactor;
  HelloTimer *t = new HelloTimer(p);

  int fd = server("127.0.0.1", 2222);
  IListenerHandler *l = new IListenerHandler(fd, p);
  
  p->schedule(t, &tv);
  p->schedule(l);
  p->runEventLoop();
  return 0;
}

