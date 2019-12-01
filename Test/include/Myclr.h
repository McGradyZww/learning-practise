/*
   @author   : zouww
   @date     : 2019.07.06
   @version  : 1.0.0
   @copyright: ©2019 zouww
*/

#pragma once
#include <vector>
#include <map>
#include <string>
#include <vcclr.h>
#include <assert.h>

#ifdef __cplusplus_cli
#define String_GCPtr System::String^
#define GC_Ptr ^
#define GC_NULLPTR nullptr
#define GC_GCNEW gcnew
#define GCRef ref
#define GC_Override override
#define GCStrList System::Collections::Generic::List<String_GCPtr>^
#define GCStrDictionary System::Collections::Generic::Dictionary<String_GCPtr,String_GCPtr>^
#define GCStrKeyValuePair System::Collections::Generic::KeyValuePair<String_GCPtr,String_GCPtr>^
#define GCIntList System::Collections::Generic::List<int>^
#define GCBoolList System::Collections::Generic::List<bool>^
#define GC_Ref_Class ref class
#define GC_Value_Class value class
#define GC_Ref_Struct ref struct
#define GC_Value_Struct value struct
#define GC_Enum enum class
#define GC_EnumType class
#define GC_Property property
#define GenericList_GCPtr(e) System::Collections::Generic::List<e>^
#define GenericDic_GCPtr(e) System::Collections::Generic::Dictionary<e>^

#else
#define String_GCPtr System::String*
#define GC_Ptr *
#define GC_NULLPTR 0
#define GC_GCNEW new
#define GCRef __gc
#define GC_Override override
#define GCStrList System::Collections::Generic::List<String_GCPtr>*
#define GCStrDictionary System::Collections::Generic::Dictionary<String_GCPtr,String_GCPtr>*
#define GCStrKeyValuePair System::Collections::Generic::KeyValuePair<String_GCPtr,String_GCPtr>*
#define GCIntList System::Collections::Generic::List<int>*
#define GCBoolList System::Collections::Generic::List<bool>*
#define GC_Ref_Class __gc class
#define GC_Value_Class __value class
#define GC_Ref_Struct __gc struct
#define GC_Value_Struct __value struct
#define GC_Enum __value enum
#define GC_EnumType __value
#define GC_Property __property
#define GenericList_GCPtr(e) System::Collections::Generic::List<e>*
#define GenericDic_GCPtr(e) System::Collections::Generic::Dictionary<e>*

#endif

// string transfer tool
class StringTool
{
public:
	// wstring to String_GCPtr
	static String_GCPtr WString2String(const std::wstring& i_WStr)
	{
		return GC_GCNEW System::String(i_WStr.c_str());
	}

	// String_GCPtr to wstring
	static std::wstring String2WString(String_GCPtr i_Str)
	{
		if (i_Str == GC_NULLPTR)
		{
			return L"";
		}
#ifdef __cplusplus_cli 
		pin_ptr<const wchar_t> wch = PtrToStringChars(i_Str);
#else
		const wchar_t __pin* wch = PtrToStringChars(i_szStr);
#endif

		return std::wstring(wch);
	}

	// wstring array to String_GCPtr array, not produce memory for caller.
	static void WString2String(const std::vector<std::wstring>& i_arWStr, GCStrList o_arStr)
	{
		assert(o_arStr != GC_NULLPTR);
		for each(std::wstring str in i_arWStr)
		{
			o_arStr->Add(WString2String(str));
		}
	}

	// String_GCPtr array to wstring array
	static void String2WString(GCStrList i_arStr, std::vector<std::wstring>& o_arWStr)
	{
		if (i_arStr == GC_NULLPTR)
		{
			return;
		}
#ifdef __cplusplus_cli
		for each(String_GCPtr str in i_arStr)
		{
			o_arWStr.push_back(String2WString(str));
		}
#else
		System::Collections::Generic::List<String_GCPtr>::Enumerator it = i_arStr->GetEnumerator();
		while (it.MoveNext())
		{
			String_GCPtr str = it.Current;
			o_arWStr.push_back(String2WString(str));
		}
#endif

	}

	// map to GCStrDictionary
	static void WString2String(const std::map<std::wstring, std::wstring>& i_mapWStr, GCStrDictionary o_dicStr)
	{
		for each(std::pair<std::wstring, std::wstring> strPair in i_mapWStr)
		{
			o_dicStr->Add(WString2String(strPair.first), WString2String(strPair.second));
		}
	}

	// GCStrDictionary to map
	static void String2WString(GCStrDictionary i_dicStr, std::map<std::wstring, std::wstring>& o_mapWStr)
	{
		if (i_dicStr == GC_NULLPTR)
		{
			return;
		}
#ifdef __cplusplus_cli
		for each(GCStrKeyValuePair strPair in i_dicStr)
		{
			o_mapWStr.insert(std::pair<std::wstring, std::wstring>(String2WString(strPair->Key), String2WString(strPair->Value)));
		}
	
#else
		System::Collections::Generic::Dictionary<String_GCPtr, String_GCPtr>::Enumerator it = i_dicStr->GetEnumerator();
		while (it.MoveNext())
		{
			GCStrKeyValuePair strPair = it.Current;
			o_mapWStr.insert(std::pair<std::wstring, std::wstring>(String2WString(strPair->Key), String2WString(strPair->Value)));
		}
#endif
	}

};