; ModuleID = './assign_c//test_6_0.c'
source_filename = "./assign_c//test_6_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.test5.buffer = private unnamed_addr constant [3 x i8] c"ABC", align 1
@.str = private unnamed_addr constant [17 x i8] c"buffer[%d] = %c\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test5() #0 !dbg !8 {
entry:
  %buffer = alloca [3 x i8], align 1
  %i = alloca i32, align 4
  %0 = bitcast [3 x i8]* %buffer to i8*, !dbg !12
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([3 x i8], [3 x i8]* @__const.test5.buffer, i32 0, i32 0), i64 3, i1 false), !dbg !12
  store i32 0, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !15
  %cmp = icmp sle i32 %1, 3, !dbg !16
  br i1 %cmp, label %for.body, label %for.end, !dbg !17

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !18
  %3 = load i32, i32* %i, align 4, !dbg !19
  %idxprom = sext i32 %3 to i64, !dbg !20
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %buffer, i64 0, i64 %idxprom, !dbg !20
  %4 = load i8, i8* %arrayidx, align 1, !dbg !20
  %conv = sext i8 %4 to i32, !dbg !20
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 noundef %2, i32 noundef %conv), !dbg !21
  br label %for.inc, !dbg !22

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !23
  %inc = add nsw i32 %5, 1, !dbg !23
  store i32 %inc, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !17, !llvm.loop !24

for.end:                                          ; preds = %for.cond
  ret void, !dbg !26
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/test_6_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "bab789d6ff68d63e8dd8673a7d963c17")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "test5", scope: !9, file: !9, line: 3, type: !10, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//test_6_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "bab789d6ff68d63e8dd8673a7d963c17")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 4, column: 10, scope: !8)
!13 = !DILocation(line: 5, column: 14, scope: !8)
!14 = !DILocation(line: 5, column: 10, scope: !8)
!15 = !DILocation(line: 5, column: 21, scope: !8)
!16 = !DILocation(line: 5, column: 23, scope: !8)
!17 = !DILocation(line: 5, column: 5, scope: !8)
!18 = !DILocation(line: 6, column: 37, scope: !8)
!19 = !DILocation(line: 6, column: 47, scope: !8)
!20 = !DILocation(line: 6, column: 40, scope: !8)
!21 = !DILocation(line: 6, column: 9, scope: !8)
!22 = !DILocation(line: 7, column: 5, scope: !8)
!23 = !DILocation(line: 5, column: 30, scope: !8)
!24 = distinct !{!24, !17, !22, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !DILocation(line: 8, column: 1, scope: !8)
