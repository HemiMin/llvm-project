#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include <vector>
#include <map>
#include <iostream>

using namespace llvm;
using std::vector;
using std::map;

namespace {
  class IRTransformPass : public FunctionPass {
    public:
      map<Instruction*, vector<Instruction*>> duplicateInstructions;
      static char ID;
      IRTransformPass() : FunctionPass(ID) {}

      virtual bool runOnFunction(Function &F) {
        for (auto &B : F) {
          for (BasicBlock::iterator BI = B.begin(); BI != B.end(); ++BI) {
            Instruction *I = &*BI;
            if (auto *op = dyn_cast<UnaryInstruction>(I)) {
              switch(op->getOpcode()) {
                case Instruction::Load: 
                {
                  errs() << *I << "\n";
                  CheckIdentical(&B, BI, I, duplicateInstructions);
                } break;
                default: break;
              }
            }
          }
        }
        for (auto Imap : duplicateInstructions) {
          for (auto I : Imap.second) {
            I->replaceAllUsesWith(Imap.first);
          }
        }
        for (auto Imap : duplicateInstructions) {
          errs() << *(Imap.first) << " duplicate Instructions: ";
          for (auto I : Imap.second) {
            errs() << *I << ", ";
          }
          std::cout << "\n";
          for (auto I : Imap.second) {
            I->eraseFromParent();
          }
        }
        return true;
      }

    void CheckIdentical(BasicBlock* B, BasicBlock::iterator begin, 
                        Instruction* load, map<Instruction*, vector<Instruction*>>& list)
    {
      for (BasicBlock::iterator BI = ++begin; BI != B->end(); ++BI) {
        Instruction *I = &*BI;
        if (auto *op = dyn_cast<UnaryInstruction>(I)) {
          switch(op->getOpcode()) {
            case Instruction::Load: 
            {
              if (load->isIdenticalTo(I)) {
                for (auto unique : list) {
                  if (unique.first->isIdenticalTo(I)) {
                    vector<Instruction*> v = unique.second;
                    v.push_back(I);
                    list[unique.first] = v;
                    return;
                  }
                }
                list.insert({load, {I}});
                return;
              }
            } break;
            default: break;
          }
        }
        
      }
    }
  };

}

char IRTransformPass::ID = 0;
static RegisterPass<IRTransformPass> X("irtransform", "IRTransformPass", false, false);
static llvm::RegisterStandardPasses Y(
    llvm::PassManagerBuilder::EP_EarlyAsPossible,
    [](const llvm::PassManagerBuilder &Builder,
      llvm::legacy::PassManagerBase &PM) { PM.add(new IRTransformPass()); });
