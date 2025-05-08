; ModuleID = './assign_c//test_1_1.c'
source_filename = "./assign_c//test_1_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"Buffer content: %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @boo(i8* noundef %input) #0 !dbg !8 {
entry:
  %input.addr = alloca i8*, align 8
  %buffer = alloca [64 x i8], align 16
  store i8* %input, i8** %input.addr, align 8
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %buffer, i64 0, i64 0, !dbg !12
  %0 = load i8*, i8** %input.addr, align 8, !dbg !13
  %call = call i8* @strncpy(i8* noundef %arraydecay, i8* noundef %0, i64 noundef 63) #4, !dbg !14
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* %buffer, i64 0, i64 63, !dbg !15
  store i8 0, i8* %arrayidx, align 1, !dbg !16
  %arraydecay1 = getelementptr inbounds [64 x i8], [64 x i8]* %buffer, i64 0, i64 0, !dbg !17
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay1), !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8* noundef, i8* noundef, i64 noundef) #1

declare dso_local i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !20 {
entry:
  %retval = alloca i32, align 4
  %large_input = alloca [128 x i8], align 16
  store i32 0, i32* %retval, align 4
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %large_input, i64 0, i64 0, !dbg !21
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 127, i1 false), !dbg !21
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* %large_input, i64 0, i64 127, !dbg !22
  store i8 0, i8* %arrayidx, align 1, !dbg !23
  %arraydecay1 = getelementptr inbounds [128 x i8], [128 x i8]* %large_input, i64 0, i64 0, !dbg !24
  call void @boo(i8* noundef %arraydecay1), !dbg !25
  ret i32 0, !dbg !26
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/test_1_1.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "c41adfd8cb3d8ec6ea519da97590865e")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "boo", scope: !9, file: !9, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//test_1_1.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "c41adfd8cb3d8ec6ea519da97590865e")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 6, column: 13, scope: !8)
!13 = !DILocation(line: 6, column: 21, scope: !8)
!14 = !DILocation(line: 6, column: 5, scope: !8)
!15 = !DILocation(line: 7, column: 5, scope: !8)
!16 = !DILocation(line: 7, column: 32, scope: !8)
!17 = !DILocation(line: 8, column: 36, scope: !8)
!18 = !DILocation(line: 8, column: 5, scope: !8)
!19 = !DILocation(line: 9, column: 1, scope: !8)
!20 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 11, type: !10, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!21 = !DILocation(line: 13, column: 5, scope: !20)
!22 = !DILocation(line: 14, column: 5, scope: !20)
!23 = !DILocation(line: 14, column: 22, scope: !20)
!24 = !DILocation(line: 15, column: 9, scope: !20)
!25 = !DILocation(line: 15, column: 5, scope: !20)
!26 = !DILocation(line: 16, column: 5, scope: !20)
