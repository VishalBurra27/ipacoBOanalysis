; ModuleID = './assign_c//test_5_0.c'
source_filename = "./assign_c//test_5_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Test4: %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test4() #0 !dbg !8 {
entry:
  %buffer = alloca [5 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4, !dbg !12
  br label %for.cond, !dbg !13

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !14
  %cmp = icmp sle i32 %0, 5, !dbg !15
  br i1 %cmp, label %for.body, label %for.end, !dbg !16

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !17
  %idxprom = sext i32 %1 to i64, !dbg !18
  %arrayidx = getelementptr inbounds [5 x i8], [5 x i8]* %buffer, i64 0, i64 %idxprom, !dbg !18
  store i8 65, i8* %arrayidx, align 1, !dbg !19
  br label %for.inc, !dbg !20

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !21
  %inc = add nsw i32 %2, 1, !dbg !21
  store i32 %inc, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !16, !llvm.loop !22

for.end:                                          ; preds = %for.cond
  %arrayidx1 = getelementptr inbounds [5 x i8], [5 x i8]* %buffer, i64 0, i64 4, !dbg !24
  store i8 0, i8* %arrayidx1, align 1, !dbg !25
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %buffer, i64 0, i64 0, !dbg !26
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay), !dbg !27
  ret void, !dbg !28
}

declare dso_local i32 @printf(i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/test_5_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "790f56f3c6424f496304d2da5a2e7fbd")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "test4", scope: !9, file: !9, line: 4, type: !10, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//test_5_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "790f56f3c6424f496304d2da5a2e7fbd")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 6, column: 14, scope: !8)
!13 = !DILocation(line: 6, column: 10, scope: !8)
!14 = !DILocation(line: 6, column: 21, scope: !8)
!15 = !DILocation(line: 6, column: 23, scope: !8)
!16 = !DILocation(line: 6, column: 5, scope: !8)
!17 = !DILocation(line: 7, column: 16, scope: !8)
!18 = !DILocation(line: 7, column: 9, scope: !8)
!19 = !DILocation(line: 7, column: 19, scope: !8)
!20 = !DILocation(line: 8, column: 5, scope: !8)
!21 = !DILocation(line: 6, column: 30, scope: !8)
!22 = distinct !{!22, !16, !20, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !DILocation(line: 9, column: 5, scope: !8)
!25 = !DILocation(line: 9, column: 15, scope: !8)
!26 = !DILocation(line: 10, column: 27, scope: !8)
!27 = !DILocation(line: 10, column: 5, scope: !8)
!28 = !DILocation(line: 11, column: 1, scope: !8)
