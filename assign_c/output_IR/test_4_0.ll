; ModuleID = './assign_c//test_4_0.c'
source_filename = "./assign_c//test_4_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Debug: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"Sum: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"i: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @main() #0 !dbg !8 {
entry:
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  %ptr = alloca i32*, align 8
  %dummy = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32 0, i32* %sum, align 4, !dbg !12
  store i32 0, i32* %i, align 4, !dbg !13
  store i32* %i, i32** %ptr, align 8, !dbg !14
  store i32 0, i32* %dummy, align 4, !dbg !15
  store i32 0, i32* %j, align 4, !dbg !16
  br label %for.cond, !dbg !17

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !18
  %cmp = icmp slt i32 %0, 1, !dbg !19
  br i1 %cmp, label %for.body, label %for.end, !dbg !20

for.body:                                         ; preds = %for.cond
  br label %while.cond, !dbg !21

while.cond:                                       ; preds = %while.body, %for.body
  %1 = load i32, i32* %dummy, align 4, !dbg !22
  %cmp1 = icmp slt i32 %1, 5, !dbg !23
  br i1 %cmp1, label %while.body, label %while.end, !dbg !21

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %j, align 4, !dbg !24
  %shl = shl i32 %2, 1, !dbg !25
  %3 = load i32, i32* %dummy, align 4, !dbg !26
  %add = add nsw i32 %3, %shl, !dbg !26
  store i32 %add, i32* %dummy, align 4, !dbg !26
  br label %while.cond, !dbg !21, !llvm.loop !27

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !30

for.inc:                                          ; preds = %while.end
  %4 = load i32, i32* %j, align 4, !dbg !31
  %inc = add nsw i32 %4, 1, !dbg !31
  store i32 %inc, i32* %j, align 4, !dbg !31
  br label %for.cond, !dbg !20, !llvm.loop !32

for.end:                                          ; preds = %for.cond
  br label %do.body, !dbg !33

do.body:                                          ; preds = %do.cond, %for.end
  %5 = load i32*, i32** %ptr, align 8, !dbg !34
  %6 = load i32, i32* %5, align 4, !dbg !35
  %7 = load i32, i32* %sum, align 4, !dbg !36
  %add2 = add nsw i32 %7, %6, !dbg !36
  store i32 %add2, i32* %sum, align 4, !dbg !36
  %8 = load i32*, i32** %ptr, align 8, !dbg !37
  %9 = load i32, i32* %8, align 4, !dbg !38
  %inc3 = add nsw i32 %9, 1, !dbg !38
  store i32 %inc3, i32* %8, align 4, !dbg !38
  %10 = load i32*, i32** %ptr, align 8, !dbg !39
  %11 = load i32, i32* %10, align 4, !dbg !40
  %cmp4 = icmp sge i32 %11, 10, !dbg !41
  br i1 %cmp4, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !42

if.end:                                           ; preds = %do.body
  %12 = load i32, i32* %dummy, align 4, !dbg !43
  %cmp5 = icmp ne i32 %12, -999, !dbg !44
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !43

if.then6:                                         ; preds = %if.end
  %13 = load i32, i32* %sum, align 4, !dbg !45
  %add7 = add nsw i32 %13, 0, !dbg !45
  store i32 %add7, i32* %sum, align 4, !dbg !45
  br label %if.end8, !dbg !46

if.end8:                                          ; preds = %if.then6, %if.end
  %14 = load i32*, i32** %ptr, align 8, !dbg !47
  %15 = load i32, i32* %14, align 4, !dbg !48
  %mul = mul nsw i32 %15, 2, !dbg !49
  store i32 %mul, i32* %temp, align 4, !dbg !50
  %16 = load i32, i32* %temp, align 4, !dbg !51
  br label %do.cond, !dbg !52

do.cond:                                          ; preds = %if.end8
  br i1 true, label %do.body, label %do.end, !dbg !52, !llvm.loop !53

do.end:                                           ; preds = %do.cond, %if.then
  %17 = load i32, i32* %dummy, align 4, !dbg !55
  %mul9 = mul nsw i32 %17, 0, !dbg !56
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i32 noundef %mul9), !dbg !57
  %18 = load i32, i32* %sum, align 4, !dbg !58
  %call10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef %18), !dbg !59
  %19 = load i32, i32* %i, align 4, !dbg !60
  %call11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i32 noundef %19), !dbg !61
  ret void, !dbg !62
}

declare dso_local i32 @printf(i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/test_4_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "e22ed8734b07ece5e17cfa375dac8e93")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 1, type: !10, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//test_4_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "e22ed8734b07ece5e17cfa375dac8e93")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 2, column: 9, scope: !8)
!13 = !DILocation(line: 3, column: 9, scope: !8)
!14 = !DILocation(line: 4, column: 10, scope: !8)
!15 = !DILocation(line: 5, column: 9, scope: !8)
!16 = !DILocation(line: 8, column: 14, scope: !8)
!17 = !DILocation(line: 8, column: 10, scope: !8)
!18 = !DILocation(line: 8, column: 21, scope: !8)
!19 = !DILocation(line: 8, column: 23, scope: !8)
!20 = !DILocation(line: 8, column: 5, scope: !8)
!21 = !DILocation(line: 9, column: 9, scope: !8)
!22 = !DILocation(line: 9, column: 16, scope: !8)
!23 = !DILocation(line: 9, column: 22, scope: !8)
!24 = !DILocation(line: 10, column: 23, scope: !8)
!25 = !DILocation(line: 10, column: 25, scope: !8)
!26 = !DILocation(line: 10, column: 19, scope: !8)
!27 = distinct !{!27, !21, !28, !29}
!28 = !DILocation(line: 11, column: 9, scope: !8)
!29 = !{!"llvm.loop.mustprogress"}
!30 = !DILocation(line: 12, column: 5, scope: !8)
!31 = !DILocation(line: 8, column: 29, scope: !8)
!32 = distinct !{!32, !20, !30, !29}
!33 = !DILocation(line: 15, column: 5, scope: !8)
!34 = !DILocation(line: 16, column: 17, scope: !8)
!35 = !DILocation(line: 16, column: 16, scope: !8)
!36 = !DILocation(line: 16, column: 13, scope: !8)
!37 = !DILocation(line: 17, column: 11, scope: !8)
!38 = !DILocation(line: 17, column: 15, scope: !8)
!39 = !DILocation(line: 18, column: 14, scope: !8)
!40 = !DILocation(line: 18, column: 13, scope: !8)
!41 = !DILocation(line: 18, column: 18, scope: !8)
!42 = !DILocation(line: 18, column: 25, scope: !8)
!43 = !DILocation(line: 21, column: 13, scope: !8)
!44 = !DILocation(line: 21, column: 19, scope: !8)
!45 = !DILocation(line: 22, column: 17, scope: !8)
!46 = !DILocation(line: 23, column: 9, scope: !8)
!47 = !DILocation(line: 26, column: 21, scope: !8)
!48 = !DILocation(line: 26, column: 20, scope: !8)
!49 = !DILocation(line: 26, column: 25, scope: !8)
!50 = !DILocation(line: 26, column: 13, scope: !8)
!51 = !DILocation(line: 27, column: 15, scope: !8)
!52 = !DILocation(line: 28, column: 5, scope: !8)
!53 = distinct !{!53, !33, !54}
!54 = !DILocation(line: 28, column: 15, scope: !8)
!55 = !DILocation(line: 31, column: 27, scope: !8)
!56 = !DILocation(line: 31, column: 33, scope: !8)
!57 = !DILocation(line: 31, column: 5, scope: !8)
!58 = !DILocation(line: 34, column: 25, scope: !8)
!59 = !DILocation(line: 34, column: 5, scope: !8)
!60 = !DILocation(line: 35, column: 23, scope: !8)
!61 = !DILocation(line: 35, column: 5, scope: !8)
!62 = !DILocation(line: 36, column: 1, scope: !8)
