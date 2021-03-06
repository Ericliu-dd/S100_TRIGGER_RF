@@HISTORY
    REVISION = V01;
@@END_HISTORY

@@BOOKING
  TRIGGER_RF; 

  RF_5841_INIT;
  RF_5830_INIT;
  
  RF_GAIN;
  RF_EVM_4MS;
  RF_EVM_280US; 

  
@@END_BOOKING

@@UNBOOKING
@@END_UNBOOKING



	char buffer[128];  

	typedef int 		(FAR __stdcall *LP_DDRF_TestDll)(int a,int b);
  
	typedef int 		(FAR __stdcall *LP_DDRF_CONNECT)();
	typedef int 		(FAR __stdcall *LP_NI_VST_Connect)();
	typedef int 		(FAR __stdcall *LP_NI_584x_Init)();
	typedef int 		(FAR __stdcall *LP_NI_583x_Init)();

// VSG
	typedef void 		(FAR __stdcall *LP_NI_VSG_SetFrequency)(double freq);
	typedef void 		(FAR __stdcall *LP_NI_VSG_SetPowerLevel)(double power);
	typedef void 		(FAR __stdcall *LP_NI_VSG_OutputEnable)(bool enable);
	typedef void 		(FAR __stdcall *LP_NI_VSG_SetModulationState)(bool enable);
	typedef void 		(FAR __stdcall *LP_NI_VSG_PrioritizeEVM)(bool enable);
	typedef void 		(FAR __stdcall *LP_NI_VSG_SetTriggerFreeRun)(bool enable);
	typedef void 		(FAR __stdcall *LP_NI_VSG_LoadWaveform)(char *wfmName);
	typedef void 		(FAR __stdcall *LP_NI_VSG_AutomaticLOFrequency)(bool enable);

// VSA
	typedef void 		(FAR __stdcall *LP_NI_VSA_SetFrequency)(double freq);
	typedef double 		(FAR __stdcall *LP_NI_VSA_ReadSpectrumPower)();
	typedef void 		(FAR __stdcall *LP_NI_VSA_Capture)(double rfPulseWidth);
	typedef void 		(FAR __stdcall *LP_NI_VSA_LoadWaveform)(char *wfmName);
	typedef void 		(FAR __stdcall *LP_NI_VSA_SetTriggerFreeRun)(bool enable);
	typedef double 		(FAR __stdcall *LP_NI_VSA_ReadEVM)();
	typedef void 		(FAR __stdcall *LP_NI_VSA_AutomaticLOFrequency)(bool enable);
  
  
  LP_DDRF_TestDll    						DLL_DDRF_TestDll = NULL;
  LP_DDRF_CONNECT							DLL_DDRF_CONNECT = NULL;
  LP_NI_VST_Connect							DLL_NI_VST_Connect = NULL;
  LP_NI_584x_Init							DLL_NI_584x_Init = NULL;
  LP_NI_583x_Init							DLL_NI_583x_Init = NULL;
  
  
  LP_NI_VSG_SetFrequency					DLL_NI_VSG_SetFrequency = NULL;
  LP_NI_VSG_SetPowerLevel					DLL_NI_VSG_SetPowerLevel = NULL;
  LP_NI_VSG_OutputEnable					DLL_NI_VSG_OutputEnable = NULL;
  LP_NI_VSG_SetModulationState				DLL_NI_VSG_SetModulationState = NULL;
  LP_NI_VSG_PrioritizeEVM					DLL_NI_VSG_PrioritizeEVM = NULL;
  LP_NI_VSG_SetTriggerFreeRun				DLL_NI_VSG_SetTriggerFreeRun = NULL;
  LP_NI_VSG_LoadWaveform					DLL_NI_VSG_LoadWaveform = NULL;
  LP_NI_VSG_AutomaticLOFrequency			DLL_NI_VSG_AutomaticLOFrequency = NULL;
  
  LP_NI_VSA_SetFrequency					DLL_NI_VSA_SetFrequency = NULL;
  LP_NI_VSA_ReadSpectrumPower				DLL_NI_VSA_ReadSpectrumPower = NULL;
  LP_NI_VSA_Capture							DLL_NI_VSA_Capture = NULL;
  LP_NI_VSA_LoadWaveform					DLL_NI_VSA_LoadWaveform = NULL;
  LP_NI_VSA_SetTriggerFreeRun				DLL_NI_VSA_SetTriggerFreeRun = NULL;
  LP_NI_VSA_ReadEVM							DLL_NI_VSA_ReadEVM = NULL;
  LP_NI_VSA_AutomaticLOFrequency			DLL_NI_VSA_AutomaticLOFrequency = NULL;
   
  HINSTANCE HinstDll = NULL ;







@@START_UP
  IO_SET_DUT_BOARD_POWER(ON,5V_USER_POWER);
 
  HinstDll = LoadLibrary("../DDRF.dll");
  if(HinstDll) 
	{
		DLL_DDRF_TestDll = (LP_DDRF_TestDll)GetProcAddress(HinstDll,"DDRF_TestDll");
		DLL_DDRF_CONNECT = (LP_DDRF_CONNECT)GetProcAddress(HinstDll,"DDRF_CONNECT");	   
		DLL_NI_VST_Connect = (LP_NI_VST_Connect)GetProcAddress(HinstDll,"NI_VST_Connect");	   
		DLL_NI_584x_Init = (LP_NI_584x_Init)GetProcAddress(HinstDll,"NI_584x_Init");
		DLL_NI_583x_Init = (LP_NI_584x_Init)GetProcAddress(HinstDll,"NI_583x_Init");		
		
		DLL_NI_VSG_SetFrequency = (LP_NI_VSG_SetFrequency)GetProcAddress(HinstDll,"NI_VSG_SetFrequency");	   
		DLL_NI_VSG_SetPowerLevel = (LP_NI_VSG_SetPowerLevel)GetProcAddress(HinstDll,"NI_VSG_SetPowerLevel");	   
		DLL_NI_VSG_OutputEnable = (LP_NI_VSG_OutputEnable)GetProcAddress(HinstDll,"NI_VSG_OutputEnable");	   
		DLL_NI_VSG_SetModulationState = (LP_NI_VSG_SetModulationState)GetProcAddress(HinstDll,"NI_VSG_SetModulationState");	   
		DLL_NI_VSG_PrioritizeEVM = (LP_NI_VSG_PrioritizeEVM)GetProcAddress(HinstDll,"NI_VSG_PrioritizeEVM");	   
		DLL_NI_VSG_SetTriggerFreeRun = (LP_NI_VSG_SetTriggerFreeRun)GetProcAddress(HinstDll,"NI_VSG_SetTriggerFreeRun");	   
		DLL_NI_VSG_LoadWaveform = (LP_NI_VSG_LoadWaveform)GetProcAddress(HinstDll,"NI_VSG_LoadWaveform");	   
		DLL_NI_VSG_AutomaticLOFrequency = (LP_NI_VSG_AutomaticLOFrequency)GetProcAddress(HinstDll,"NI_VSG_AutomaticLOFrequency");	  
		
		DLL_NI_VSA_SetFrequency = (LP_NI_VSA_SetFrequency)GetProcAddress(HinstDll,"NI_VSA_SetFrequency");	   
		DLL_NI_VSA_ReadSpectrumPower = (LP_NI_VSA_ReadSpectrumPower)GetProcAddress(HinstDll,"NI_VSA_ReadSpectrumPower");	   
		DLL_NI_VSA_Capture = (LP_NI_VSA_Capture)GetProcAddress(HinstDll,"NI_VSA_Capture");	   
		DLL_NI_VSA_LoadWaveform = (LP_NI_VSA_LoadWaveform)GetProcAddress(HinstDll,"NI_VSA_LoadWaveform");	   
		DLL_NI_VSA_SetTriggerFreeRun = (LP_NI_VSA_SetTriggerFreeRun)GetProcAddress(HinstDll,"NI_VSA_SetTriggerFreeRun");	   
		DLL_NI_VSA_ReadEVM = (LP_NI_VSA_ReadEVM)GetProcAddress(HinstDll,"NI_VSA_ReadEVM");	   
		DLL_NI_VSA_AutomaticLOFrequency = (LP_NI_VSA_AutomaticLOFrequency)GetProcAddress(HinstDll,"NI_VSA_AutomaticLOFrequency");	   
  }
	else
  {
		sprintf(buffer,"Load DLL fail");	WRITELN(buffer);  	  	
  }  
  
  int temp_dll = 0 ;
  //temp_dll = DLL_DDRF_TestDll(5,6);

  sprintf(buffer,"temp_dll=%d",temp_dll);	WRITELN(buffer);
 
  //DLL_DDRF_CONNECT();
  //DLL_NI_584x_Init();
	//DLL_NI_583x_Init();
  
  
@@END_START_UP


@@PLAN TRIGGER_RF
  SITE_SEQUENCE      = OFF;
  DISABLE_BY_MARK_NO = NULL;
  GO_THROUGH         = ON;
  REMARK             = Continuity;
        
  LOGIC_SET_DRV_LEVEL("1",3.3V,0.0V,0.0V,VR1);
  LOGIC_SET_CMP_LEVEL("1",1.65V,1.65V,VR1);
  LOGIC_CLOSE_PE_RELAY("1,2",CONNECT_MODE);
  WAIT(1MS);
  RUN_PATTERN(RF_TRIGGER:ST280US,RF_TRIGGER:SP280US,1,2); //CONT start trigger RF
  WAIT(1MS);  
  LOGIC_CLEAR_CONT();
  
  RUN_PATTERN(RF_TRIGGER:ST4MS,RF_TRIGGER:SP4MS,1,2); //CONT start trigger RF
  WAIT(1MS);  
  LOGIC_CLEAR_CONT();
  
  LOGIC_SET_DRV_LEVEL("1,2",0.0V,0.0V,0.0V,VR1);
  LOGIC_CLOSE_PE_RELAY("1,2",DISCONNECT_MODE);

        
  CONDITION
    IF_FAIL
        REJECT_BIN=2;
@@END_PLAN






@@PLAN RF_5841_INIT
  SITE_SEQUENCE      = OFF;
  DISABLE_BY_MARK_NO = NULL;
  GO_THROUGH         = ON;
  REMARK             = RF_5841_INIT;
        
  DLL_DDRF_CONNECT();
  DLL_NI_584x_Init();
        
  CONDITION
    IF_FAIL
        REJECT_BIN=2;
@@END_PLAN

@@PLAN RF_5830_INIT
  SITE_SEQUENCE      = OFF;
  DISABLE_BY_MARK_NO = NULL;
  GO_THROUGH         = ON;
  REMARK             = RF_5830_INIT;
        
  DLL_DDRF_CONNECT();
  DLL_NI_583x_Init();
        
  CONDITION
    IF_FAIL
        REJECT_BIN=2;
@@END_PLAN


@@PLAN RF_GAIN
  SITE_SEQUENCE      = OFF;
  DISABLE_BY_MARK_NO = NULL;
  GO_THROUGH         = ON;
  REMARK             = RF_GAIN;
        
  double peak_power;
  
  DLL_NI_VSG_SetFrequency(5210000000);
  DLL_NI_VSG_SetPowerLevel(-40);
  DLL_NI_VSG_OutputEnable(true);
  DLL_NI_VSA_SetFrequency(5210000000);
  
  
  peak_power = DLL_NI_VSA_ReadSpectrumPower();
  sprintf(buffer,"peak_power=%f",peak_power);	WRITELN(buffer);
  DLL_NI_VSG_OutputEnable(false);  
  //WAIT(30MS);
  
  DLL_NI_VSG_SetFrequency(5210000000);
  DLL_NI_VSG_SetPowerLevel(-43);
  DLL_NI_VSG_OutputEnable(true);
  DLL_NI_VSA_SetFrequency(5210000000);

  
  peak_power = DLL_NI_VSA_ReadSpectrumPower();
  sprintf(buffer,"peak_power=%f",peak_power);	WRITELN(buffer); 
  DLL_NI_VSG_OutputEnable(false);  
	//WAIT(30MS);

        
  CONDITION
    IF_FAIL
        REJECT_BIN=2;
@@END_PLAN


@@PLAN RF_EVM_4MS
  SITE_SEQUENCE      = OFF;
  DISABLE_BY_MARK_NO = NULL;
  GO_THROUGH         = ON;
  REMARK             = RF_EVM_4MS;
        

  LOGIC_SET_DRV_LEVEL("1",3.3V,0.0V,0.0V,VR1);
  LOGIC_SET_CMP_LEVEL("1",1.65V,1.65V,VR1);
  LOGIC_CLOSE_PE_RELAY("1,2",CONNECT_MODE);
  WAIT(1MS); 
  RUN_PATTERN(RF_TRIGGER:ST4MS,RF_TRIGGER:SP4MS,1,2); //CONT start trigger RF

  double EVM;
  
  DLL_NI_VSG_LoadWaveform("C:\\example_waveforms\\AX80M11_4MS.tdms"); 
  DLL_NI_VSA_LoadWaveform("C:\\example_waveforms\\AX80M11_4MS.tdms");   
  
  DLL_NI_VSG_SetFrequency(5210000000);
  DLL_NI_VSA_SetFrequency(5210000000);
  
  DLL_NI_VSG_SetPowerLevel(-10);
  
	DLL_NI_VSG_SetTriggerFreeRun(false);
	DLL_NI_VSA_SetTriggerFreeRun(false);
	
	WAIT(30MS);	
	EVM = DLL_NI_VSA_ReadEVM();
	sprintf(buffer,"EVM=%f",EVM);	WRITELN(buffer);   

	//EVM = DLL_NI_VSA_ReadEVM();
	//sprintf(buffer,"EVM=%f",EVM);	WRITELN(buffer);   

	//EVM = DLL_NI_VSA_ReadEVM();
	//sprintf(buffer,"EVM=%f",EVM);	WRITELN(buffer);   	
	
	
	LOGIC_CLEAR_CONT();//stop trigger RF
  LOGIC_SET_DRV_LEVEL("1,2",0.0V,0.0V,0.0V,VR1);
  LOGIC_CLOSE_PE_RELAY("1,2",DISCONNECT_MODE);


        
  CONDITION
    IF_FAIL
        REJECT_BIN=2;
@@END_PLAN


@@PLAN RF_EVM_280US
  SITE_SEQUENCE      = OFF;
  DISABLE_BY_MARK_NO = NULL;
  GO_THROUGH         = ON;
  REMARK             = RF_EVM_280US;
        

  LOGIC_SET_DRV_LEVEL("1",3.3V,0.0V,0.0V,VR1);
  LOGIC_SET_CMP_LEVEL("1",1.65V,1.65V,VR1);
  LOGIC_CLOSE_PE_RELAY("1,2",CONNECT_MODE);
  WAIT(1MS); 
  RUN_PATTERN(RF_TRIGGER:ST280US,RF_TRIGGER:SP280US,1,2); //CONT start trigger RF

  double EVM;
  
	DLL_NI_VSG_LoadWaveform("C:\\example_waveforms\\AX80M11_280US.metadata.tdms");   
	DLL_NI_VSA_LoadWaveform("C:\\example_waveforms\\AX80M11_280US.metadata.tdms");    
	
  DLL_NI_VSG_SetFrequency(5210000000);
  DLL_NI_VSA_SetFrequency(5210000000);
  
  DLL_NI_VSG_SetPowerLevel(-10);
  
	DLL_NI_VSG_SetTriggerFreeRun(false);
	DLL_NI_VSA_SetTriggerFreeRun(false);
 
	WAIT(30MS);	
	EVM = DLL_NI_VSA_ReadEVM();
	sprintf(buffer,"EVM=%f",EVM);	WRITELN(buffer);   

	//EVM = DLL_NI_VSA_ReadEVM();
	//sprintf(buffer,"EVM=%f",EVM);	WRITELN(buffer);   

	//EVM = DLL_NI_VSA_ReadEVM();
	//sprintf(buffer,"EVM=%f",EVM);	WRITELN(buffer);   	
	
	
	LOGIC_CLEAR_CONT();//stop trigger RF
  LOGIC_SET_DRV_LEVEL("1,2",0.0V,0.0V,0.0V,VR1);
  LOGIC_CLOSE_PE_RELAY("1,2",DISCONNECT_MODE);


        
  CONDITION
    IF_FAIL
        REJECT_BIN=2;
@@END_PLAN



