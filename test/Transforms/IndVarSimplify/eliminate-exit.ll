; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -indvars -S < %s | FileCheck %s

define void @ult(i64 %n, i64 %m) {
; CHECK-LABEL: @ult(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP0:%.*]] = icmp ult i64 [[N:%.*]], [[M:%.*]]
; CHECK-NEXT:    br i1 [[CMP0]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add i64 [[IV]], 1
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ult i64 [[IV]], [[N]]
; CHECK-NEXT:    br i1 [[CMP1]], label [[LATCH]], label [[EXIT_LOOPEXIT:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @side_effect()
; CHECK-NEXT:    br i1 true, label [[LOOP]], label [[EXIT_LOOPEXIT]]
; CHECK:       exit.loopexit:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %cmp0 = icmp ult i64 %n, %m
  br i1 %cmp0, label %loop, label %exit
loop:
  %iv = phi i64 [ 0, %entry ], [ %iv.next, %latch ]
  %iv.next = add i64 %iv, 1
  %cmp1 = icmp ult i64 %iv, %n
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @side_effect()
  %cmp2 = icmp ult i64 %iv, %m
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}

define void @ugt(i64 %n, i64 %m) {
; CHECK-LABEL: @ugt(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP0:%.*]] = icmp ugt i64 [[N:%.*]], [[M:%.*]]
; CHECK-NEXT:    br i1 [[CMP0]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add i64 [[IV]], 1
; CHECK-NEXT:    br i1 true, label [[LATCH]], label [[EXIT_LOOPEXIT:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @side_effect()
; CHECK-NEXT:    [[CMP2:%.*]] = icmp ult i64 [[IV]], [[M]]
; CHECK-NEXT:    br i1 [[CMP2]], label [[LOOP]], label [[EXIT_LOOPEXIT]]
; CHECK:       exit.loopexit:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %cmp0 = icmp ugt i64 %n, %m
  br i1 %cmp0, label %loop, label %exit
loop:
  %iv = phi i64 [ 0, %entry ], [ %iv.next, %latch ]
  %iv.next = add i64 %iv, 1
  %cmp1 = icmp ult i64 %iv, %n
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @side_effect()
  %cmp2 = icmp ult i64 %iv, %m
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}

define void @ule(i64 %n, i64 %m) {
; CHECK-LABEL: @ule(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP0:%.*]] = icmp ule i64 [[N:%.*]], [[M:%.*]]
; CHECK-NEXT:    br i1 [[CMP0]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add i64 [[IV]], 1
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ult i64 [[IV]], [[N]]
; CHECK-NEXT:    br i1 [[CMP1]], label [[LATCH]], label [[EXIT_LOOPEXIT:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @side_effect()
; CHECK-NEXT:    [[CMP2:%.*]] = icmp ult i64 [[IV]], [[M]]
; CHECK-NEXT:    br i1 [[CMP2]], label [[LOOP]], label [[EXIT_LOOPEXIT]]
; CHECK:       exit.loopexit:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %cmp0 = icmp ule i64 %n, %m
  br i1 %cmp0, label %loop, label %exit
loop:
  %iv = phi i64 [ 0, %entry ], [ %iv.next, %latch ]
  %iv.next = add i64 %iv, 1
  %cmp1 = icmp ult i64 %iv, %n
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @side_effect()
  %cmp2 = icmp ult i64 %iv, %m
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}

define void @uge(i64 %n, i64 %m) {
; CHECK-LABEL: @uge(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP0:%.*]] = icmp uge i64 [[N:%.*]], [[M:%.*]]
; CHECK-NEXT:    br i1 [[CMP0]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add i64 [[IV]], 1
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ult i64 [[IV]], [[N]]
; CHECK-NEXT:    br i1 [[CMP1]], label [[LATCH]], label [[EXIT_LOOPEXIT:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @side_effect()
; CHECK-NEXT:    [[CMP2:%.*]] = icmp ult i64 [[IV]], [[M]]
; CHECK-NEXT:    br i1 [[CMP2]], label [[LOOP]], label [[EXIT_LOOPEXIT]]
; CHECK:       exit.loopexit:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %cmp0 = icmp uge i64 %n, %m
  br i1 %cmp0, label %loop, label %exit
loop:
  %iv = phi i64 [ 0, %entry ], [ %iv.next, %latch ]
  %iv.next = add i64 %iv, 1
  %cmp1 = icmp ult i64 %iv, %n
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @side_effect()
  %cmp2 = icmp ult i64 %iv, %m
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}


define void @ult_const_max(i64 %n) {
; CHECK-LABEL: @ult_const_max(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP0:%.*]] = icmp ult i64 [[N:%.*]], 20
; CHECK-NEXT:    br i1 [[CMP0]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add nuw nsw i64 [[IV]], 1
; CHECK-NEXT:    br i1 true, label [[LATCH]], label [[EXIT_LOOPEXIT:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @side_effect()
; CHECK-NEXT:    [[CMP2:%.*]] = icmp ult i64 [[IV]], [[N]]
; CHECK-NEXT:    br i1 [[CMP2]], label [[LOOP]], label [[EXIT_LOOPEXIT]]
; CHECK:       exit.loopexit:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %cmp0 = icmp ult i64 %n, 20
  br i1 %cmp0, label %loop, label %exit
loop:
  %iv = phi i64 [ 0, %entry ], [ %iv.next, %latch ]
  %iv.next = add i64 %iv, 1
  %udiv = udiv i64 %iv, 10
  %cmp1 = icmp ult i64 %udiv, 2
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @side_effect()
  %cmp2 = icmp ult i64 %iv, %n
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}

define void @mixed_width(i32 %len) {
; CHECK-LABEL: @mixed_width(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[LEN_ZEXT:%.*]] = zext i32 [[LEN:%.*]] to i64
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[IV_NEXT:%.*]], [[BACKEDGE:%.*]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add nuw nsw i64 [[IV]], 1
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ult i64 [[IV]], [[LEN_ZEXT]]
; CHECK-NEXT:    br i1 [[CMP1]], label [[BACKEDGE]], label [[EXIT:%.*]]
; CHECK:       backedge:
; CHECK-NEXT:    call void @side_effect()
; CHECK-NEXT:    br i1 true, label [[LOOP]], label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %len.zext = zext i32 %len to i64
  br label %loop
loop:
  %iv = phi i64 [0, %entry], [%iv.next, %backedge]
  %iv2 = phi i32 [0, %entry], [%iv2.next, %backedge]
  %iv.next = add i64 %iv, 1
  %iv2.next = add i32 %iv2, 1
  %cmp1 = icmp ult i64 %iv, %len.zext
  br i1 %cmp1, label %backedge, label %exit

backedge:
  call void @side_effect()
  %cmp2 = icmp ult i32 %iv2, %len
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}

declare void @side_effect()
