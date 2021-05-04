//---------------------------------------------------------------------------
#ifndef DDRF
#define DDRF

#ifdef DDRF_EXPORTS
#define DDRF_API __declspec(dllexport)
#else
#define DDRF_API __declspec(dllimport)
#endif

extern "C"
{

DDRF_API int __stdcall DDRF_TestDll(int a,int b);
DDRF_API int __stdcall DDRF_CONNECT();
DDRF_API double __stdcall DDRF_VSG(double freq,double power);


DDRF_API int __stdcall NI_VST_Connect();
DDRF_API int __stdcall NI_584x_Init();
DDRF_API int __stdcall NI_583x_Init();

// VSG
DDRF_API void __stdcall NI_VSG_SetFrequency(double freq);
DDRF_API void __stdcall NI_VSG_SetPowerLevel(double power);
DDRF_API void __stdcall NI_VSG_OutputEnable(bool enable);
DDRF_API void __stdcall NI_VSG_SetModulationState(bool enable);
DDRF_API void __stdcall NI_VSG_PrioritizeEVM(bool enable);
DDRF_API void __stdcall NI_VSG_SetTriggerFreeRun(bool enable);
DDRF_API void __stdcall NI_VSG_LoadWaveform(char *wfmName );
DDRF_API void __stdcall NI_VSG_AutomaticLOFrequency(bool enable);

// VSA
DDRF_API void __stdcall NI_VSA_SetFrequency(double freq);
DDRF_API double __stdcall NI_VSA_ReadSpectrumPower();
DDRF_API void __stdcall NI_VSA_Capture(double rfPulseWidth);
DDRF_API void __stdcall NI_VSA_LoadWaveform(char *wfmName );
DDRF_API void __stdcall NI_VSA_SetTriggerFreeRun(bool enable);
DDRF_API double __stdcall NI_VSA_ReadEVM();
DDRF_API void __stdcall NI_VSA_AutomaticLOFrequency(bool enable);

};

//---------------------------------------------------------------------------
#endif



