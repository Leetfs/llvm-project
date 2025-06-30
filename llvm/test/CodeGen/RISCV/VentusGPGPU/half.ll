; RUN: llc -mtriple=riscv32 -mcpu=ventus-gpgpu -mattr=+zvfhmin %s -o - \
; RUN:   | FileCheck -check-prefix=VENTUS %s

@vec2 = global <2 x half> zeroinitializer, align 2
; @vec4 = global <4 x half> zeroinitializer, align 2
; @vec8 = global <8 x half> zeroinitializer, align 2
; @vec16 = global <16 x half> zeroinitializer, align 2

; Test vector load of <2 x half>
define <2 x half> @test_vle2(<2 x half>* %src) {
entry:
  ; VENTUS:    vle16.v v0, 0(v0)
  %v = load <2 x half>, <2 x half>* %src, align 2
  ret <2 x half> %v
}

; Test vector store of <2 x half>
define void @test_vse2(<2 x half>* %dst, <2 x half> %v) {
entry:
  ; VENTUS:    vse16.v v1, 0(v0)
  store <2 x half> %v, <2 x half>* %dst, align 2
  ret void
}


; ; Test vector load of <4 x half>
; define <4 x half> @test_vle4(<4 x half>* %src) {
; entry:
;   ; VENTUS:    vle16.v v0, 0(v0)
;   %v = load <4 x half>, <4 x half>* %src, align 2
;   ret <4 x half> %v
; }

; ; Test vector store of <4 x half>
; define void @test_vse4(<4 x half>* %dst, <4 x half> %v) {
; entry:
;   ; VENTUS:    vse16.v v1, 0(v0)
;   store <4 x half> %v, <4 x half>* %dst, align 2
;   ret void
; }

; ; Test vector load of <8 x half>
; define <8 x half> @test_vle8(<8 x half>* %src) {
; entry:
;   ; VENTUS:    vle16.v v0, 0(v0)
;   %v = load <8 x half>, <8 x half>* %src, align 2
;   ret <8 x half> %v
; }

; ; Test vector store of <8 x half>
; define void @test_vse8(<8 x half>* %dst, <8 x half> %v) {
; entry:
;   ; VENTUS:    vse16.v v1, 0(v0)
;   store <8 x half> %v, <8 x half>* %dst, align 2
;   ret void
; }

; ; Test vector load of <16 x half>
; define <16 x half> @test_vle16(<16 x half>* %src) {
; entry:
;   ; VENTUS:    vle16.v v0, 0(v0)
;   %v = load <16 x half>, <16 x half>* %src, align 2
;   ret <16 x half> %v
; }

; ; Test vector store of <16 x half>
; define void @test_vse16(<16 x half>* %dst, <16 x half> %v) {
; entry:
;   ; VENTUS:    vse16.v v1, 0(v0)
;   store <16 x half> %v, <16 x half>* %dst, align 2
;   ret void
; }

; ; Test f16 to f32 conversion for <4 x half>
; define <4 x float> @test_fpext4(<4 x half> %v) {
; entry:
;   ; VENTUS:    vfwcvt.f.f.v v0, v0
;   %ext = fpext <4 x half> %v to <4 x float>
;   ret <4 x float> %ext
; }

; ; Test f32 to f16 conversion for <4 x float>
; define <4 x half> @test_fptrunc4(<4 x float> %v) {
; entry:
;   ; VENTUS:    vfncvt.f.f.w v0, v0
;   %trunc = fptrunc <4 x float> %v to <4 x half>
;   ret <4 x half> %trunc
; }

; ; Test f16 to f32 conversion for <8 x half>
; define <8 x float> @test_fpext8(<8 x half> %v) {
; entry:
;   ; VENTUS:    vfwcvt.f.f.v v0, v0
;   %ext = fpext <8 x half> %v to <8 x float>
;   ret <8 x float> %ext
; }

; ; Test f32 to f16 conversion for <8 x float>
; define <8 x half> @test_fptrunc8(<8 x float> %v) {
; entry:
;   ; VENTUS:    vfncvt.f.f.w v0, v0
;   %trunc = fptrunc <8 x float> %v to <8 x half>
;   ret <8 x half> %trunc
; }

; ; Test f16 to f32 conversion for <16 x half>
; define <16 x float> @test_fpext16(<16 x half> %v) {
; entry:
;   ; VENTUS:    vfwcvt.f.f.v v0, v0
;   %ext = fpext <16 x half> %v to <16 x float>
;   ret <16 x float> %ext
; }

; ; Test f32 to f16 conversion for <16 x float>
; define <16 x half> @test_fptrunc16(<16 x float> %v) {
; entry:
;   ; VENTUS:    vfncvt.f.f.w v0, v0
;   %trunc = fptrunc <16 x float> %v to <16 x half>
;   ret <16 x half> %trunc
; }