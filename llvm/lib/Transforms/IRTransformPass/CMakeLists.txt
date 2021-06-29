add_llvm_library( LLVMIRTransformPass MODULE
  IRTransformPass.cpp

  PLUGIN_TOOL
  opt
  )

