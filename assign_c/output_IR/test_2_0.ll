; ModuleID = './assign_c//test_2_0.c'
source_filename = "./assign_c//test_2_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.foo.temp = private unnamed_addr constant [20 x i8] c"Hello\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str = private unnamed_addr constant [5 x i8] c"init\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Buffer before input: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"copied[%d] = %c\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Length so far: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"Enter some text: \00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"You entered: %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo() #0 !dbg !8 {
entry:
  %buffer = alloca [10 x i8], align 1
  %temp = alloca [20 x i8], align 16
  %length = alloca i32, align 4
  %i = alloca i32, align 4
  %copied = alloca [10 x i8], align 1
  %0 = bitcast [20 x i8]* %temp to i8*, !dbg !12
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([20 x i8], [20 x i8]* @__const.foo.temp, i32 0, i32 0), i64 20, i1 false), !dbg !12
  store i32 0, i32* %length, align 4, !dbg !13
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0, !dbg !14
  %call = call i8* @strcpy(i8* noundef %arraydecay, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #4, !dbg !15
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 4, !dbg !16
  store i8 95, i8* %arrayidx, align 1, !dbg !17
  %arrayidx1 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 5, !dbg !18
  store i8 120, i8* %arrayidx1, align 1, !dbg !19
  %arrayidx2 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 6, !dbg !20
  store i8 0, i8* %arrayidx2, align 1, !dbg !21
  %arraydecay3 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0, !dbg !22
  %call4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i8* noundef %arraydecay3), !dbg !23
  %arraydecay5 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 0, !dbg !24
  %arraydecay6 = getelementptr inbounds [20 x i8], [20 x i8]* %temp, i64 0, i64 0, !dbg !25
  %call7 = call i8* @strncpy(i8* noundef %arraydecay5, i8* noundef %arraydecay6, i64 noundef 10) #4, !dbg !26
  %arrayidx8 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 9, !dbg !27
  store i8 0, i8* %arrayidx8, align 1, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !31
  %idxprom = sext i32 %1 to i64, !dbg !32
  %arrayidx9 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 %idxprom, !dbg !32
  %2 = load i8, i8* %arrayidx9, align 1, !dbg !32
  %conv = sext i8 %2 to i32, !dbg !32
  %cmp = icmp ne i32 %conv, 0, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !35
  %4 = load i32, i32* %i, align 4, !dbg !36
  %idxprom11 = sext i32 %4 to i64, !dbg !37
  %arrayidx12 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 %idxprom11, !dbg !37
  %5 = load i8, i8* %arrayidx12, align 1, !dbg !37
  %conv13 = sext i8 %5 to i32, !dbg !37
  %call14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i32 noundef %3, i32 noundef %conv13), !dbg !38
  %6 = load i32, i32* %length, align 4, !dbg !39
  %inc = add nsw i32 %6, 1, !dbg !39
  store i32 %inc, i32* %length, align 4, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !41
  %inc15 = add nsw i32 %7, 1, !dbg !41
  store i32 %inc15, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !34, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %length, align 4, !dbg !44
  %call16 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 noundef %8), !dbg !45
  %call17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0)), !dbg !46
  %arraydecay18 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0, !dbg !47
  %call19 = call i32 (i8*, ...) bitcast (i32 (...)* @gets to i32 (i8*, ...)*)(i8* noundef %arraydecay18), !dbg !48
  %arraydecay20 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0, !dbg !49
  %call21 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0), i8* noundef %arraydecay20), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8* noundef, i8* noundef) #2

declare dso_local i32 @printf(i8* noundef, ...) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8* noundef, i8* noundef, i64 noundef) #2

declare dso_local i32 @gets(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @foo(), !dbg !53
  ret i32 0, !dbg !54
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/test_2_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "fe5a0d6234bce340a21337cb4d52322e")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "foo", scope: !9, file: !9, line: 5, type: !10, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//test_2_0.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "fe5a0d6234bce340a21337cb4d52322e")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 7, column: 10, scope: !8)
!13 = !DILocation(line: 8, column: 9, scope: !8)
!14 = !DILocation(line: 12, column: 12, scope: !8)
!15 = !DILocation(line: 12, column: 5, scope: !8)
!16 = !DILocation(line: 15, column: 5, scope: !8)
!17 = !DILocation(line: 15, column: 15, scope: !8)
!18 = !DILocation(line: 16, column: 5, scope: !8)
!19 = !DILocation(line: 16, column: 15, scope: !8)
!20 = !DILocation(line: 17, column: 5, scope: !8)
!21 = !DILocation(line: 17, column: 15, scope: !8)
!22 = !DILocation(line: 19, column: 41, scope: !8)
!23 = !DILocation(line: 19, column: 5, scope: !8)
!24 = !DILocation(line: 23, column: 13, scope: !8)
!25 = !DILocation(line: 23, column: 21, scope: !8)
!26 = !DILocation(line: 23, column: 5, scope: !8)
!27 = !DILocation(line: 24, column: 5, scope: !8)
!28 = !DILocation(line: 24, column: 32, scope: !8)
!29 = !DILocation(line: 27, column: 12, scope: !8)
!30 = !DILocation(line: 27, column: 10, scope: !8)
!31 = !DILocation(line: 27, column: 24, scope: !8)
!32 = !DILocation(line: 27, column: 17, scope: !8)
!33 = !DILocation(line: 27, column: 27, scope: !8)
!34 = !DILocation(line: 27, column: 5, scope: !8)
!35 = !DILocation(line: 28, column: 37, scope: !8)
!36 = !DILocation(line: 28, column: 47, scope: !8)
!37 = !DILocation(line: 28, column: 40, scope: !8)
!38 = !DILocation(line: 28, column: 9, scope: !8)
!39 = !DILocation(line: 29, column: 15, scope: !8)
!40 = !DILocation(line: 30, column: 5, scope: !8)
!41 = !DILocation(line: 27, column: 37, scope: !8)
!42 = distinct !{!42, !34, !40, !43}
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 32, column: 35, scope: !8)
!45 = !DILocation(line: 32, column: 5, scope: !8)
!46 = !DILocation(line: 35, column: 5, scope: !8)
!47 = !DILocation(line: 36, column: 10, scope: !8)
!48 = !DILocation(line: 36, column: 5, scope: !8)
!49 = !DILocation(line: 38, column: 33, scope: !8)
!50 = !DILocation(line: 38, column: 5, scope: !8)
!51 = !DILocation(line: 39, column: 1, scope: !8)
!52 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 41, type: !10, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!53 = !DILocation(line: 42, column: 5, scope: !52)
!54 = !DILocation(line: 43, column: 5, scope: !52)
