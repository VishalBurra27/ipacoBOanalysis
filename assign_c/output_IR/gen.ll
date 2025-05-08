; ModuleID = './assign_c//gen.c'
source_filename = "./assign_c//gen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ModPlugFile = type { i8* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ModPlug_InstrumentName(%struct.ModPlugFile* noundef %file, i32 noundef %qual, i8* noundef %buff) #0 !dbg !8 {
entry:
  %retval = alloca i32, align 4
  %file.addr = alloca %struct.ModPlugFile*, align 8
  %qual.addr = alloca i32, align 4
  %buff.addr = alloca i8*, align 8
  %str = alloca i8*, align 8
  %retval1 = alloca i32, align 4
  %tmpretval = alloca i64, align 8
  store %struct.ModPlugFile* %file, %struct.ModPlugFile** %file.addr, align 8
  store i32 %qual, i32* %qual.addr, align 4
  store i8* %buff, i8** %buff.addr, align 8
  %0 = load %struct.ModPlugFile*, %struct.ModPlugFile** %file.addr, align 8, !dbg !12
  %tobool = icmp ne %struct.ModPlugFile* %0, null, !dbg !12
  br i1 %tobool, label %if.end, label %if.then, !dbg !13

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !14
  br label %return, !dbg !14

if.end:                                           ; preds = %entry
  %1 = load %struct.ModPlugFile*, %struct.ModPlugFile** %file.addr, align 8, !dbg !15
  %mod = getelementptr inbounds %struct.ModPlugFile, %struct.ModPlugFile* %1, i32 0, i32 0, !dbg !16
  %2 = load i8*, i8** %mod, align 8, !dbg !16
  %3 = load i32, i32* %qual.addr, align 4, !dbg !17
  %sub = sub i32 %3, 1, !dbg !18
  %call = call i8* @openmpt_module_get_instrument_name(i8* noundef %2, i32 noundef %sub), !dbg !19
  store i8* %call, i8** %str, align 8, !dbg !20
  %4 = load i8*, i8** %str, align 8, !dbg !21
  %tobool2 = icmp ne i8* %4, null, !dbg !21
  br i1 %tobool2, label %if.end7, label %if.then3, !dbg !22

if.then3:                                         ; preds = %if.end
  %5 = load i8*, i8** %buff.addr, align 8, !dbg !23
  %tobool4 = icmp ne i8* %5, null, !dbg !23
  br i1 %tobool4, label %if.then5, label %if.end6, !dbg !23

if.then5:                                         ; preds = %if.then3
  %6 = load i8*, i8** %buff.addr, align 8, !dbg !24
  store i8 0, i8* %6, align 1, !dbg !25
  br label %if.end6, !dbg !26

if.end6:                                          ; preds = %if.then5, %if.then3
  store i32 0, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

if.end7:                                          ; preds = %if.end
  %7 = load i8*, i8** %str, align 8, !dbg !28
  %call8 = call i64 @strlen(i8* noundef %7) #4, !dbg !29
  store i64 %call8, i64* %tmpretval, align 8, !dbg !30
  %8 = load i64, i64* %tmpretval, align 8, !dbg !31
  %cmp = icmp uge i64 %8, 2147483647, !dbg !32
  br i1 %cmp, label %if.then9, label %if.end10, !dbg !31

if.then9:                                         ; preds = %if.end7
  store i64 2147483646, i64* %tmpretval, align 8, !dbg !33
  br label %if.end10, !dbg !34

if.end10:                                         ; preds = %if.then9, %if.end7
  %9 = load i64, i64* %tmpretval, align 8, !dbg !35
  %conv = trunc i64 %9 to i32, !dbg !36
  store i32 %conv, i32* %retval1, align 4, !dbg !37
  %10 = load i8*, i8** %buff.addr, align 8, !dbg !38
  %tobool11 = icmp ne i8* %10, null, !dbg !38
  br i1 %tobool11, label %if.then12, label %if.end14, !dbg !38

if.then12:                                        ; preds = %if.end10
  %11 = load i8*, i8** %buff.addr, align 8, !dbg !39
  %12 = load i8*, i8** %str, align 8, !dbg !40
  %13 = load i32, i32* %retval1, align 4, !dbg !41
  %add = add i32 %13, 1, !dbg !42
  %conv13 = zext i32 %add to i64, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %12, i64 %conv13, i1 false), !dbg !43
  %14 = load i8*, i8** %buff.addr, align 8, !dbg !44
  %15 = load i32, i32* %retval1, align 4, !dbg !45
  %idxprom = zext i32 %15 to i64, !dbg !44
  %arrayidx = getelementptr inbounds i8, i8* %14, i64 %idxprom, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !46
  br label %if.end14, !dbg !47

if.end14:                                         ; preds = %if.then12, %if.end10
  %16 = load i8*, i8** %str, align 8, !dbg !48
  call void @openmpt_free_string(i8* noundef %16), !dbg !49
  %17 = load i32, i32* %retval1, align 4, !dbg !50
  store i32 %17, i32* %retval, align 4, !dbg !51
  br label %return, !dbg !51

return:                                           ; preds = %if.end14, %if.end6, %if.then
  %18 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %18, !dbg !52
}

declare dso_local i8* @openmpt_module_get_instrument_name(i8* noundef, i32 noundef) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @openmpt_free_string(i8* noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/gen.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "d3f1ad8f410ba9bb03577d101a964e17")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "ModPlug_InstrumentName", scope: !9, file: !9, line: 2, type: !10, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//gen.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "d3f1ad8f410ba9bb03577d101a964e17")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 7, column: 7, scope: !8)
!13 = !DILocation(line: 7, column: 6, scope: !8)
!14 = !DILocation(line: 7, column: 13, scope: !8)
!15 = !DILocation(line: 8, column: 44, scope: !8)
!16 = !DILocation(line: 8, column: 50, scope: !8)
!17 = !DILocation(line: 8, column: 54, scope: !8)
!18 = !DILocation(line: 8, column: 58, scope: !8)
!19 = !DILocation(line: 8, column: 9, scope: !8)
!20 = !DILocation(line: 8, column: 7, scope: !8)
!21 = !DILocation(line: 9, column: 6, scope: !8)
!22 = !DILocation(line: 9, column: 5, scope: !8)
!23 = !DILocation(line: 10, column: 6, scope: !8)
!24 = !DILocation(line: 11, column: 5, scope: !8)
!25 = !DILocation(line: 11, column: 10, scope: !8)
!26 = !DILocation(line: 12, column: 3, scope: !8)
!27 = !DILocation(line: 13, column: 3, scope: !8)
!28 = !DILocation(line: 15, column: 21, scope: !8)
!29 = !DILocation(line: 15, column: 14, scope: !8)
!30 = !DILocation(line: 15, column: 12, scope: !8)
!31 = !DILocation(line: 16, column: 5, scope: !8)
!32 = !DILocation(line: 16, column: 14, scope: !8)
!33 = !DILocation(line: 17, column: 13, scope: !8)
!34 = !DILocation(line: 18, column: 3, scope: !8)
!35 = !DILocation(line: 19, column: 16, scope: !8)
!36 = !DILocation(line: 19, column: 11, scope: !8)
!37 = !DILocation(line: 19, column: 9, scope: !8)
!38 = !DILocation(line: 20, column: 6, scope: !8)
!39 = !DILocation(line: 21, column: 10, scope: !8)
!40 = !DILocation(line: 21, column: 15, scope: !8)
!41 = !DILocation(line: 21, column: 19, scope: !8)
!42 = !DILocation(line: 21, column: 25, scope: !8)
!43 = !DILocation(line: 21, column: 3, scope: !8)
!44 = !DILocation(line: 22, column: 3, scope: !8)
!45 = !DILocation(line: 22, column: 8, scope: !8)
!46 = !DILocation(line: 22, column: 16, scope: !8)
!47 = !DILocation(line: 23, column: 3, scope: !8)
!48 = !DILocation(line: 24, column: 22, scope: !8)
!49 = !DILocation(line: 24, column: 2, scope: !8)
!50 = !DILocation(line: 25, column: 9, scope: !8)
!51 = !DILocation(line: 25, column: 2, scope: !8)
!52 = !DILocation(line: 26, column: 2, scope: !8)
