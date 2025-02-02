; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -mattr=+experimental-v -verify-machineinstrs \
; RUN:   < %s | FileCheck %s

define dso_local void @lots_args(i32 signext %x0, i32 signext %x1, <vscale x 16 x i32> %v0, i32 signext %x2, i32 signext %x3, i32 signext %x4, i32 signext %x5, i32 signext %x6, i32 %x7, i32 %x8, i32 %x9) #0 {
; CHECK-LABEL: lots_args:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addi sp, sp, -80
; CHECK-NEXT:    sd ra, 72(sp) # 8-byte Folded Spill
; CHECK-NEXT:    sd s0, 64(sp) # 8-byte Folded Spill
; CHECK-NEXT:    addi s0, sp, 80
; CHECK-NEXT:    csrr t0, vlenb
; CHECK-NEXT:    slli t0, t0, 3
; CHECK-NEXT:    sub sp, sp, t0
; CHECK-NEXT:    ld t0, 8(s0)
; CHECK-NEXT:    ld t1, 0(s0)
; CHECK-NEXT:    sw a0, -36(s0)
; CHECK-NEXT:    sw a1, -40(s0)
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    sub a0, s0, a0
; CHECK-NEXT:    addi a0, a0, -80
; CHECK-NEXT:    vs8r.v v8, (a0)
; CHECK-NEXT:    sw a2, -44(s0)
; CHECK-NEXT:    sw a3, -48(s0)
; CHECK-NEXT:    sw a4, -52(s0)
; CHECK-NEXT:    sw a5, -56(s0)
; CHECK-NEXT:    sw a6, -60(s0)
; CHECK-NEXT:    sw a7, -64(s0)
; CHECK-NEXT:    sw t1, -68(s0)
; CHECK-NEXT:    sw t0, -72(s0)
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    ld s0, 64(sp) # 8-byte Folded Reload
; CHECK-NEXT:    ld ra, 72(sp) # 8-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 80
; CHECK-NEXT:    ret
entry:
  %x0.addr = alloca i32, align 4
  %x1.addr = alloca i32, align 4
  %v0.addr = alloca <vscale x 16 x i32>, align 4
  %x2.addr = alloca i32, align 4
  %x3.addr = alloca i32, align 4
  %x4.addr = alloca i32, align 4
  %x5.addr = alloca i32, align 4
  %x6.addr = alloca i32, align 4
  %x7.addr = alloca i32, align 4
  %x8.addr = alloca i32, align 4
  %x9.addr = alloca i32, align 4
  store i32 %x0, i32* %x0.addr, align 4
  store i32 %x1, i32* %x1.addr, align 4
  store <vscale x 16 x i32> %v0, <vscale x 16 x i32>* %v0.addr, align 4
  store i32 %x2, i32* %x2.addr, align 4
  store i32 %x3, i32* %x3.addr, align 4
  store i32 %x4, i32* %x4.addr, align 4
  store i32 %x5, i32* %x5.addr, align 4
  store i32 %x6, i32* %x6.addr, align 4
  store i32 %x7, i32* %x7.addr, align 4
  store i32 %x8, i32* %x8.addr, align 4
  store i32 %x9, i32* %x9.addr, align 4
  ret void
}

define dso_local signext i32 @main() #0 {
; CHECK-LABEL: main:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addi sp, sp, -128
; CHECK-NEXT:    sd ra, 120(sp) # 8-byte Folded Spill
; CHECK-NEXT:    sd s0, 112(sp) # 8-byte Folded Spill
; CHECK-NEXT:    addi s0, sp, 128
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    sub sp, sp, a0
; CHECK-NEXT:    sw zero, -36(s0)
; CHECK-NEXT:    sd zero, -48(s0)
; CHECK-NEXT:    sd zero, -56(s0)
; CHECK-NEXT:    vsetivli a0, 4, e32, m8, ta, mu
; CHECK-NEXT:    sd a0, -64(s0)
; CHECK-NEXT:    ld a0, -64(s0)
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, mu
; CHECK-NEXT:    addi a0, s0, -56
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    sub a0, s0, a0
; CHECK-NEXT:    addi a0, a0, -128
; CHECK-NEXT:    vs8r.v v8, (a0)
; CHECK-NEXT:    addi a0, zero, 1
; CHECK-NEXT:    sw a0, -68(s0)
; CHECK-NEXT:    sw a0, -72(s0)
; CHECK-NEXT:    sw a0, -76(s0)
; CHECK-NEXT:    sw a0, -80(s0)
; CHECK-NEXT:    sw a0, -84(s0)
; CHECK-NEXT:    sw a0, -88(s0)
; CHECK-NEXT:    sw a0, -92(s0)
; CHECK-NEXT:    sw a0, -96(s0)
; CHECK-NEXT:    sw a0, -100(s0)
; CHECK-NEXT:    sw a0, -104(s0)
; CHECK-NEXT:    lw a0, -68(s0)
; CHECK-NEXT:    lw a1, -72(s0)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    sub a2, s0, a2
; CHECK-NEXT:    addi a2, a2, -128
; CHECK-NEXT:    vl8re32.v v8, (a2)
; CHECK-NEXT:    lw a2, -76(s0)
; CHECK-NEXT:    lw a3, -80(s0)
; CHECK-NEXT:    lw a4, -84(s0)
; CHECK-NEXT:    lw a5, -88(s0)
; CHECK-NEXT:    lw a6, -92(s0)
; CHECK-NEXT:    lw a7, -96(s0)
; CHECK-NEXT:    lw t0, -100(s0)
; CHECK-NEXT:    lw t1, -104(s0)
; CHECK-NEXT:    sd t1, 8(sp)
; CHECK-NEXT:    sd t0, 0(sp)
; CHECK-NEXT:    call lots_args
; CHECK-NEXT:    lw a0, -68(s0)
; CHECK-NEXT:    lw a1, -72(s0)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    sub a2, s0, a2
; CHECK-NEXT:    addi a2, a2, -128
; CHECK-NEXT:    vl8re32.v v8, (a2)
; CHECK-NEXT:    lw a2, -76(s0)
; CHECK-NEXT:    lw a3, -80(s0)
; CHECK-NEXT:    lw a4, -84(s0)
; CHECK-NEXT:    lw a5, -88(s0)
; CHECK-NEXT:    lw a6, -92(s0)
; CHECK-NEXT:    lw a7, -96(s0)
; CHECK-NEXT:    lw t0, -100(s0)
; CHECK-NEXT:    lw t1, -104(s0)
; CHECK-NEXT:    sd t1, 8(sp)
; CHECK-NEXT:    sd t0, 0(sp)
; CHECK-NEXT:    call lots_args
; CHECK-NEXT:    mv a0, zero
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 3
; CHECK-NEXT:    add sp, sp, a1
; CHECK-NEXT:    ld s0, 112(sp) # 8-byte Folded Reload
; CHECK-NEXT:    ld ra, 120(sp) # 8-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 128
; CHECK-NEXT:    ret
entry:
  %retval = alloca i32, align 4
  %input = alloca [4 x i32], align 4
  %vl = alloca i64, align 8
  %v0 = alloca <vscale x 16 x i32>, align 4
  %x0 = alloca i32, align 4
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %0 = bitcast [4 x i32]* %input to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %0, i8 0, i64 16, i1 false)
  %1 = call i64 @llvm.riscv.vsetvli.i64(i64 4, i64 2, i64 3)
  store i64 %1, i64* %vl, align 8
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %input, i64 0, i64 0
  %2 = load i64, i64* %vl, align 8
  %3 = bitcast i32* %arraydecay to <vscale x 16 x i32>*
  %4 = call <vscale x 16 x i32> @llvm.riscv.vle.nxv16i32.i64(<vscale x 16 x i32>* %3, i64 %2)
  store <vscale x 16 x i32> %4, <vscale x 16 x i32>* %v0, align 4
  store i32 1, i32* %x0, align 4
  store i32 1, i32* %x1, align 4
  store i32 1, i32* %x2, align 4
  store i32 1, i32* %x3, align 4
  store i32 1, i32* %x4, align 4
  store i32 1, i32* %x5, align 4
  store i32 1, i32* %x6, align 4
  store i32 1, i32* %x7, align 4
  store i32 1, i32* %x8, align 4
  store i32 1, i32* %x9, align 4
  %5 = load i32, i32* %x0, align 4
  %6 = load i32, i32* %x1, align 4
  %7 = load <vscale x 16 x i32>, <vscale x 16 x i32>* %v0, align 4
  %8 = load i32, i32* %x2, align 4
  %9 = load i32, i32* %x3, align 4
  %10 = load i32, i32* %x4, align 4
  %11 = load i32, i32* %x5, align 4
  %12 = load i32, i32* %x6, align 4
  %13 = load i32, i32* %x7, align 4
  %14 = load i32, i32* %x8, align 4
  %15 = load i32, i32* %x9, align 4
  call void @lots_args(i32 signext %5, i32 signext %6, <vscale x 16 x i32> %7, i32 signext %8, i32 signext %9, i32 signext %10, i32 signext %11, i32 signext %12, i32 %13, i32 %14, i32 %15)
  %16 = load i32, i32* %x0, align 4
  %17 = load i32, i32* %x1, align 4
  %18 = load <vscale x 16 x i32>, <vscale x 16 x i32>* %v0, align 4
  %19 = load i32, i32* %x2, align 4
  %20 = load i32, i32* %x3, align 4
  %21 = load i32, i32* %x4, align 4
  %22 = load i32, i32* %x5, align 4
  %23 = load i32, i32* %x6, align 4
  %24 = load i32, i32* %x7, align 4
  %25 = load i32, i32* %x8, align 4
  %26 = load i32, i32* %x9, align 4
  call void @lots_args(i32 signext %16, i32 signext %17, <vscale x 16 x i32> %18, i32 signext %19, i32 signext %20, i32 signext %21, i32 signext %22, i32 signext %23, i32 %24, i32 %25, i32 %26)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg)

declare i64 @llvm.riscv.vsetvli.i64(i64, i64 immarg, i64 immarg)

declare <vscale x 16 x i32> @llvm.riscv.vle.nxv16i32.i64(<vscale x 16 x i32>* nocapture, i64)

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" }
