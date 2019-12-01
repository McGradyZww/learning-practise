

#ifdef _WIN32
	#if !defined( LD_CALL_MODE )
		#define LD_CALL_MODE		__stdcall
	#endif
  #ifdef BUILDING_DLL
    #define DLLEXPORT __declspec(dllexport)
  #else
    #define DLLEXPORT __declspec(dllimport)
  #endif
  #define DLLLOCAL
#else
	#define LD_CALL_MODE
  #define DLLEXPORT __attribute__ ((visibility("default")))
  #define DLLLOCAL __attribute__ ((visibility("hidden")))
#endif

//	定义基本整型
#ifdef _WIN32
//typedef 
#else

#endif

//	定义套接字相关类型？