src_files=$(wildcard *.cpp)
objects=$(subst .cpp,.o,$(src_files))
target:${objects}
	g++ ${objects} -lpthread -o a.out
$(objects):%.o:%.cpp
	g++ -g -c -D_HAVE_TIMER_ADD $< -o $@

.PHONY:clean
clean:
	rm -rf a.out*
	rm -f $(objects)
