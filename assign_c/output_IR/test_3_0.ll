; ModuleID = './assign_c//test_3_0.c'
source_filename = "./assign_c//test_3_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"Sum: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"i: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @main() #0 !dbg !8 {
entry:
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %sum, align 4, !dbg !12
  store i32 0, i32* %i, align 4, !dbg !13
  br label %while.cond, !dbg !14

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !15
  %cmp = icmp slt i32 %0, 10, !dbg !16
  br i1 %cmp, label %while.body, label %while.end, !dbg !14

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %i, align 4, !dbg !17
  %2 = load i32, i32* %sum, align 4, !dbg !18
  %add = add nsw i32 %2, %1, !dbg !18
  store i32 %add, i32* %sum, align 4, !dbg !18
  %3 = load i32, i32* %i, align 4, !dbg !19
  %inc = add nsw i32 %3, 1, !dbg !19
  store i32 %inc, i32* %i, align 4, !dbg !19
  br label %while.cond, !dbg !14, !llvm.loop !20

while.end:                                        ; preds = %while.cond
  %4 = load i32, i32* %sum, align 4, !dbg !23
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 noundef %4), !dbg !24
  %5 = load i32, i32* %i, align 4, !dbg !25
  %call1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef %5), !dbg !26
  ret void, !dbg !27
}

declare dso_local i32 @printf(i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/test_3_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "275e55b03481e9dc5270a84dbe6b4b03")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 1, type: !10, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//test_3_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "275e55b03481e9dc5270a84dbe6b4b03")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 2, column: 9, scope: !8)
!13 = !DILocation(line: 3, column: 9, scope: !8)
!14 = !DILocation(line: 5, column: 5, scope: !8)
!15 = !DILocation(line: 5, column: 11, scope: !8)
!16 = !DILocation(line: 5, column: 13, scope: !8)
!17 = !DILocation(line: 6, column: 16, scope: !8)
!18 = !DILocation(line: 6, column: 13, scope: !8)
!19 = !DILocation(line: 7, column: 10, scope: !8)
!20 = distinct !{!20, !14, !21, !22}
!21 = !DILocation(line: 8, column: 5, scope: !8)
!22 = !{!"llvm.loop.mustprogress"}
!23 = !DILocation(line: 10, column: 25, scope: !8)
!24 = !DILocation(line: 10, column: 5, scope: !8)
!25 = !DILocation(line: 11, column: 23, scope: !8)
!26 = !DILocation(line: 11, column: 5, scope: !8)
!27 = !DILocation(line: 12, column: 1, scope: !8)
