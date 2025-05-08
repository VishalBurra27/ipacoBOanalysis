; ModuleID = './assign_c//file_comparator.c'
source_filename = "./assign_c//file_comparator.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"Memory allocation failed\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"Memory reallocation failed\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"strdup failed\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"../vulnerable_lines.txt\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [26 x i8] c"Error opening output file\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [43 x i8] c"Usage: %s <original_file> <modified_file>\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clean_line(i8* noundef %line) #0 !dbg !8 {
entry:
  %line.addr = alloca i8*, align 8
  %in_block_comment = alloca i8, align 1
  %p = alloca i8*, align 8
  %output = alloca i8*, align 8
  %in_string = alloca i8, align 1
  %len = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 8
  store i8 0, i8* %in_block_comment, align 1, !dbg !12
  %0 = load i8*, i8** %line.addr, align 8, !dbg !13
  store i8* %0, i8** %p, align 8, !dbg !14
  %1 = load i8*, i8** %line.addr, align 8, !dbg !15
  store i8* %1, i8** %output, align 8, !dbg !16
  store i8 0, i8* %in_string, align 1, !dbg !17
  br label %while.cond, !dbg !18

while.cond:                                       ; preds = %if.end60, %if.then39, %if.then10, %entry
  %2 = load i8*, i8** %p, align 8, !dbg !19
  %3 = load i8, i8* %2, align 1, !dbg !20
  %conv = sext i8 %3 to i32, !dbg !20
  %cmp = icmp ne i32 %conv, 0, !dbg !21
  br i1 %cmp, label %while.body, label %while.end, !dbg !18

while.body:                                       ; preds = %while.cond
  %4 = load i8, i8* %in_block_comment, align 1, !dbg !22
  %tobool = trunc i8 %4 to i1, !dbg !22
  br i1 %tobool, label %if.else28, label %land.lhs.true, !dbg !23

land.lhs.true:                                    ; preds = %while.body
  %5 = load i8, i8* %in_string, align 1, !dbg !24
  %tobool2 = trunc i8 %5 to i1, !dbg !24
  br i1 %tobool2, label %if.else28, label %if.then, !dbg !25

if.then:                                          ; preds = %land.lhs.true
  %6 = load i8*, i8** %p, align 8, !dbg !26
  %7 = load i8, i8* %6, align 1, !dbg !27
  %conv3 = sext i8 %7 to i32, !dbg !27
  %cmp4 = icmp eq i32 %conv3, 47, !dbg !28
  br i1 %cmp4, label %land.lhs.true6, label %if.else, !dbg !29

land.lhs.true6:                                   ; preds = %if.then
  %8 = load i8*, i8** %p, align 8, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %8, i64 1, !dbg !31
  %9 = load i8, i8* %add.ptr, align 1, !dbg !32
  %conv7 = sext i8 %9 to i32, !dbg !32
  %cmp8 = icmp eq i32 %conv7, 42, !dbg !33
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !27

if.then10:                                        ; preds = %land.lhs.true6
  store i8 1, i8* %in_block_comment, align 1, !dbg !34
  %10 = load i8*, i8** %p, align 8, !dbg !35
  %add.ptr11 = getelementptr inbounds i8, i8* %10, i64 2, !dbg !35
  store i8* %add.ptr11, i8** %p, align 8, !dbg !35
  br label %while.cond, !dbg !36, !llvm.loop !37

if.else:                                          ; preds = %land.lhs.true6, %if.then
  %11 = load i8*, i8** %p, align 8, !dbg !40
  %12 = load i8, i8* %11, align 1, !dbg !41
  %conv12 = sext i8 %12 to i32, !dbg !41
  %cmp13 = icmp eq i32 %conv12, 47, !dbg !42
  br i1 %cmp13, label %land.lhs.true15, label %if.else21, !dbg !43

land.lhs.true15:                                  ; preds = %if.else
  %13 = load i8*, i8** %p, align 8, !dbg !44
  %add.ptr16 = getelementptr inbounds i8, i8* %13, i64 1, !dbg !45
  %14 = load i8, i8* %add.ptr16, align 1, !dbg !46
  %conv17 = sext i8 %14 to i32, !dbg !46
  %cmp18 = icmp eq i32 %conv17, 47, !dbg !47
  br i1 %cmp18, label %if.then20, label %if.else21, !dbg !41

if.then20:                                        ; preds = %land.lhs.true15
  %15 = load i8*, i8** %output, align 8, !dbg !48
  store i8 0, i8* %15, align 1, !dbg !49
  br label %while.end, !dbg !50

if.else21:                                        ; preds = %land.lhs.true15, %if.else
  %16 = load i8*, i8** %p, align 8, !dbg !51
  %17 = load i8, i8* %16, align 1, !dbg !52
  %conv22 = sext i8 %17 to i32, !dbg !52
  %cmp23 = icmp eq i32 %conv22, 34, !dbg !53
  br i1 %cmp23, label %if.then25, label %if.end, !dbg !52

if.then25:                                        ; preds = %if.else21
  store i8 1, i8* %in_string, align 1, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then25, %if.else21
  br label %if.end26

if.end26:                                         ; preds = %if.end
  br label %if.end27

if.end27:                                         ; preds = %if.end26
  br label %if.end57, !dbg !56

if.else28:                                        ; preds = %land.lhs.true, %while.body
  %18 = load i8, i8* %in_block_comment, align 1, !dbg !57
  %tobool29 = trunc i8 %18 to i1, !dbg !57
  br i1 %tobool29, label %if.then30, label %if.else42, !dbg !57

if.then30:                                        ; preds = %if.else28
  %19 = load i8*, i8** %p, align 8, !dbg !58
  %20 = load i8, i8* %19, align 1, !dbg !59
  %conv31 = sext i8 %20 to i32, !dbg !59
  %cmp32 = icmp eq i32 %conv31, 42, !dbg !60
  br i1 %cmp32, label %land.lhs.true34, label %if.end41, !dbg !61

land.lhs.true34:                                  ; preds = %if.then30
  %21 = load i8*, i8** %p, align 8, !dbg !62
  %add.ptr35 = getelementptr inbounds i8, i8* %21, i64 1, !dbg !63
  %22 = load i8, i8* %add.ptr35, align 1, !dbg !64
  %conv36 = sext i8 %22 to i32, !dbg !64
  %cmp37 = icmp eq i32 %conv36, 47, !dbg !65
  br i1 %cmp37, label %if.then39, label %if.end41, !dbg !59

if.then39:                                        ; preds = %land.lhs.true34
  store i8 0, i8* %in_block_comment, align 1, !dbg !66
  %23 = load i8*, i8** %p, align 8, !dbg !67
  %add.ptr40 = getelementptr inbounds i8, i8* %23, i64 2, !dbg !67
  store i8* %add.ptr40, i8** %p, align 8, !dbg !67
  br label %while.cond, !dbg !68, !llvm.loop !37

if.end41:                                         ; preds = %land.lhs.true34, %if.then30
  br label %if.end56, !dbg !69

if.else42:                                        ; preds = %if.else28
  %24 = load i8, i8* %in_string, align 1, !dbg !70
  %tobool43 = trunc i8 %24 to i1, !dbg !70
  br i1 %tobool43, label %if.then44, label %if.end55, !dbg !70

if.then44:                                        ; preds = %if.else42
  %25 = load i8*, i8** %p, align 8, !dbg !71
  %26 = load i8, i8* %25, align 1, !dbg !72
  %conv45 = sext i8 %26 to i32, !dbg !72
  %cmp46 = icmp eq i32 %conv45, 34, !dbg !73
  br i1 %cmp46, label %land.lhs.true48, label %if.end54, !dbg !74

land.lhs.true48:                                  ; preds = %if.then44
  %27 = load i8*, i8** %p, align 8, !dbg !75
  %add.ptr49 = getelementptr inbounds i8, i8* %27, i64 -1, !dbg !76
  %28 = load i8, i8* %add.ptr49, align 1, !dbg !77
  %conv50 = sext i8 %28 to i32, !dbg !77
  %cmp51 = icmp ne i32 %conv50, 92, !dbg !78
  br i1 %cmp51, label %if.then53, label %if.end54, !dbg !72

if.then53:                                        ; preds = %land.lhs.true48
  store i8 0, i8* %in_string, align 1, !dbg !79
  br label %if.end54, !dbg !80

if.end54:                                         ; preds = %if.then53, %land.lhs.true48, %if.then44
  br label %if.end55, !dbg !81

if.end55:                                         ; preds = %if.end54, %if.else42
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end41
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end27
  %29 = load i8, i8* %in_block_comment, align 1, !dbg !82
  %tobool58 = trunc i8 %29 to i1, !dbg !82
  br i1 %tobool58, label %if.end60, label %if.then59, !dbg !83

if.then59:                                        ; preds = %if.end57
  %30 = load i8*, i8** %p, align 8, !dbg !84
  %31 = load i8, i8* %30, align 1, !dbg !85
  %32 = load i8*, i8** %output, align 8, !dbg !86
  %incdec.ptr = getelementptr inbounds i8, i8* %32, i32 1, !dbg !86
  store i8* %incdec.ptr, i8** %output, align 8, !dbg !86
  store i8 %31, i8* %32, align 1, !dbg !87
  br label %if.end60, !dbg !88

if.end60:                                         ; preds = %if.then59, %if.end57
  %33 = load i8*, i8** %p, align 8, !dbg !89
  %incdec.ptr61 = getelementptr inbounds i8, i8* %33, i32 1, !dbg !89
  store i8* %incdec.ptr61, i8** %p, align 8, !dbg !89
  br label %while.cond, !dbg !18, !llvm.loop !37

while.end:                                        ; preds = %if.then20, %while.cond
  %34 = load i8*, i8** %output, align 8, !dbg !90
  store i8 0, i8* %34, align 1, !dbg !91
  %35 = load i8*, i8** %line.addr, align 8, !dbg !92
  %call = call i64 @strlen(i8* noundef %35) #7, !dbg !93
  %conv62 = trunc i64 %call to i32, !dbg !93
  store i32 %conv62, i32* %len, align 4, !dbg !94
  br label %while.cond63, !dbg !95

while.cond63:                                     ; preds = %while.body72, %while.end
  %36 = load i32, i32* %len, align 4, !dbg !96
  %cmp64 = icmp sgt i32 %36, 0, !dbg !97
  br i1 %cmp64, label %land.rhs, label %land.end, !dbg !98

land.rhs:                                         ; preds = %while.cond63
  %call66 = call i16** @__ctype_b_loc() #8, !dbg !99
  %37 = load i16*, i16** %call66, align 8, !dbg !99
  %38 = load i8*, i8** %line.addr, align 8, !dbg !99
  %39 = load i32, i32* %len, align 4, !dbg !99
  %sub = sub nsw i32 %39, 1, !dbg !99
  %idxprom = sext i32 %sub to i64, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %38, i64 %idxprom, !dbg !99
  %40 = load i8, i8* %arrayidx, align 1, !dbg !99
  %conv67 = sext i8 %40 to i32, !dbg !99
  %idxprom68 = sext i32 %conv67 to i64, !dbg !99
  %arrayidx69 = getelementptr inbounds i16, i16* %37, i64 %idxprom68, !dbg !99
  %41 = load i16, i16* %arrayidx69, align 2, !dbg !99
  %conv70 = zext i16 %41 to i32, !dbg !99
  %and = and i32 %conv70, 8192, !dbg !99
  %tobool71 = icmp ne i32 %and, 0, !dbg !98
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond63
  %42 = phi i1 [ false, %while.cond63 ], [ %tobool71, %land.rhs ], !dbg !100
  br i1 %42, label %while.body72, label %while.end75, !dbg !95

while.body72:                                     ; preds = %land.end
  %43 = load i8*, i8** %line.addr, align 8, !dbg !101
  %44 = load i32, i32* %len, align 4, !dbg !102
  %dec = add nsw i32 %44, -1, !dbg !102
  store i32 %dec, i32* %len, align 4, !dbg !102
  %idxprom73 = sext i32 %dec to i64, !dbg !101
  %arrayidx74 = getelementptr inbounds i8, i8* %43, i64 %idxprom73, !dbg !101
  store i8 0, i8* %arrayidx74, align 1, !dbg !103
  br label %while.cond63, !dbg !95, !llvm.loop !104

while.end75:                                      ; preds = %land.end
  ret void, !dbg !106
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8* noundef) #1

; Function Attrs: nounwind readnone willreturn
declare dso_local i16** @__ctype_b_loc() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8** @read_lines(i8* noundef %filename, i32* noundef %line_count) #0 !dbg !107 {
entry:
  %filename.addr = alloca i8*, align 8
  %line_count.addr = alloca i32*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %lines = alloca i8**, align 8
  %buffer = alloca [1024 x i8], align 16
  %capacity = alloca i32, align 4
  %new_lines = alloca i8**, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i32* %line_count, i32** %line_count.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !108
  %call = call noalias %struct._IO_FILE* @fopen(i8* noundef %0, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !109
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8, !dbg !110
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8, !dbg !111
  %tobool = icmp ne %struct._IO_FILE* %1, null, !dbg !111
  br i1 %tobool, label %if.end, label %if.then, !dbg !112

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0)) #9, !dbg !113
  call void @exit(i32 noundef 1) #10, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  store i8** null, i8*** %lines, align 8, !dbg !115
  store i32 10, i32* %capacity, align 4, !dbg !116
  %2 = load i32*, i32** %line_count.addr, align 8, !dbg !117
  store i32 0, i32* %2, align 4, !dbg !118
  %3 = load i32, i32* %capacity, align 4, !dbg !119
  %conv = sext i32 %3 to i64, !dbg !119
  %mul = mul i64 %conv, 8, !dbg !120
  %call1 = call noalias i8* @malloc(i64 noundef %mul) #11, !dbg !121
  %4 = bitcast i8* %call1 to i8**, !dbg !121
  store i8** %4, i8*** %lines, align 8, !dbg !122
  %5 = load i8**, i8*** %lines, align 8, !dbg !123
  %tobool2 = icmp ne i8** %5, null, !dbg !123
  br i1 %tobool2, label %if.end4, label %if.then3, !dbg !124

if.then3:                                         ; preds = %if.end
  call void @perror(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i64 0, i64 0)) #9, !dbg !125
  call void @exit(i32 noundef 1) #10, !dbg !126
  unreachable, !dbg !126

if.end4:                                          ; preds = %if.end
  br label %while.cond, !dbg !127

while.cond:                                       ; preds = %if.end24, %if.end4
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0, !dbg !128
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8, !dbg !129
  %call5 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 1024, %struct._IO_FILE* noundef %6), !dbg !130
  %tobool6 = icmp ne i8* %call5, null, !dbg !127
  br i1 %tobool6, label %while.body, label %while.end, !dbg !127

while.body:                                       ; preds = %while.cond
  %7 = load i32*, i32** %line_count.addr, align 8, !dbg !131
  %8 = load i32, i32* %7, align 4, !dbg !132
  %9 = load i32, i32* %capacity, align 4, !dbg !133
  %cmp = icmp sge i32 %8, %9, !dbg !134
  br i1 %cmp, label %if.then8, label %if.end16, !dbg !132

if.then8:                                         ; preds = %while.body
  %10 = load i32, i32* %capacity, align 4, !dbg !135
  %mul9 = mul nsw i32 %10, 2, !dbg !135
  store i32 %mul9, i32* %capacity, align 4, !dbg !135
  %11 = load i8**, i8*** %lines, align 8, !dbg !136
  %12 = bitcast i8** %11 to i8*, !dbg !136
  %13 = load i32, i32* %capacity, align 4, !dbg !137
  %conv10 = sext i32 %13 to i64, !dbg !137
  %mul11 = mul i64 %conv10, 8, !dbg !138
  %call12 = call i8* @realloc(i8* noundef %12, i64 noundef %mul11) #11, !dbg !139
  %14 = bitcast i8* %call12 to i8**, !dbg !139
  store i8** %14, i8*** %new_lines, align 8, !dbg !140
  %15 = load i8**, i8*** %new_lines, align 8, !dbg !141
  %tobool13 = icmp ne i8** %15, null, !dbg !141
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !142

if.then14:                                        ; preds = %if.then8
  call void @perror(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0)) #9, !dbg !143
  call void @exit(i32 noundef 1) #10, !dbg !144
  unreachable, !dbg !144

if.end15:                                         ; preds = %if.then8
  %16 = load i8**, i8*** %new_lines, align 8, !dbg !145
  store i8** %16, i8*** %lines, align 8, !dbg !146
  br label %if.end16, !dbg !147

if.end16:                                         ; preds = %if.end15, %while.body
  %arraydecay17 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0, !dbg !148
  call void @clean_line(i8* noundef %arraydecay17), !dbg !149
  %arraydecay18 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0, !dbg !150
  %call19 = call noalias i8* @strdup(i8* noundef %arraydecay18) #11, !dbg !151
  %17 = load i8**, i8*** %lines, align 8, !dbg !152
  %18 = load i32*, i32** %line_count.addr, align 8, !dbg !153
  %19 = load i32, i32* %18, align 4, !dbg !154
  %idxprom = sext i32 %19 to i64, !dbg !152
  %arrayidx = getelementptr inbounds i8*, i8** %17, i64 %idxprom, !dbg !152
  store i8* %call19, i8** %arrayidx, align 8, !dbg !155
  %20 = load i8**, i8*** %lines, align 8, !dbg !156
  %21 = load i32*, i32** %line_count.addr, align 8, !dbg !157
  %22 = load i32, i32* %21, align 4, !dbg !158
  %idxprom20 = sext i32 %22 to i64, !dbg !156
  %arrayidx21 = getelementptr inbounds i8*, i8** %20, i64 %idxprom20, !dbg !156
  %23 = load i8*, i8** %arrayidx21, align 8, !dbg !156
  %tobool22 = icmp ne i8* %23, null, !dbg !156
  br i1 %tobool22, label %if.end24, label %if.then23, !dbg !159

if.then23:                                        ; preds = %if.end16
  call void @perror(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0)) #9, !dbg !160
  call void @exit(i32 noundef 1) #10, !dbg !161
  unreachable, !dbg !161

if.end24:                                         ; preds = %if.end16
  %24 = load i32*, i32** %line_count.addr, align 8, !dbg !162
  %25 = load i32, i32* %24, align 4, !dbg !163
  %inc = add nsw i32 %25, 1, !dbg !163
  store i32 %inc, i32* %24, align 4, !dbg !163
  br label %while.cond, !dbg !127, !llvm.loop !164

while.end:                                        ; preds = %while.cond
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8, !dbg !166
  %call25 = call i32 @fclose(%struct._IO_FILE* noundef %26), !dbg !167
  %27 = load i8**, i8*** %lines, align 8, !dbg !168
  ret i8** %27, !dbg !169
}

declare dso_local noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #3

; Function Attrs: cold
declare dso_local void @perror(i8* noundef) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) #5

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64 noundef) #6

declare dso_local i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) #3

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8* noundef, i64 noundef) #6

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8* noundef) #6

declare dso_local i32 @fclose(%struct._IO_FILE* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @compare_files(i8* noundef %file1, i8* noundef %file2) #0 !dbg !170 {
entry:
  %file1.addr = alloca i8*, align 8
  %file2.addr = alloca i8*, align 8
  %output_file = alloca %struct._IO_FILE*, align 8
  %orig_count = alloca i32, align 4
  %mod_count = alloca i32, align 4
  %orig_lines = alloca i8**, align 8
  %mod_lines = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %next_i = alloca i32, align 4
  %next_j = alloca i32, align 4
  %found = alloca i8, align 1
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %k32 = alloca i32, align 4
  %k41 = alloca i32, align 4
  %k52 = alloca i32, align 4
  %k61 = alloca i32, align 4
  store i8* %file1, i8** %file1.addr, align 8
  store i8* %file2, i8** %file2.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)), !dbg !171
  store %struct._IO_FILE* %call, %struct._IO_FILE** %output_file, align 8, !dbg !172
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %output_file, align 8, !dbg !173
  %tobool = icmp ne %struct._IO_FILE* %0, null, !dbg !173
  br i1 %tobool, label %if.end, label %if.then, !dbg !174

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7, i64 0, i64 0)) #9, !dbg !175
  call void @exit(i32 noundef 1) #10, !dbg !176
  unreachable, !dbg !176

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %file1.addr, align 8, !dbg !177
  %call1 = call i8** @read_lines(i8* noundef %1, i32* noundef %orig_count), !dbg !178
  store i8** %call1, i8*** %orig_lines, align 8, !dbg !179
  %2 = load i8*, i8** %file2.addr, align 8, !dbg !180
  %call2 = call i8** @read_lines(i8* noundef %2, i32* noundef %mod_count), !dbg !181
  store i8** %call2, i8*** %mod_lines, align 8, !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  store i32 0, i32* %j, align 4, !dbg !184
  br label %while.cond, !dbg !185

while.cond:                                       ; preds = %if.end51, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !186
  %4 = load i32, i32* %orig_count, align 4, !dbg !187
  %cmp = icmp slt i32 %3, %4, !dbg !188
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !189

lor.rhs:                                          ; preds = %while.cond
  %5 = load i32, i32* %j, align 4, !dbg !190
  %6 = load i32, i32* %mod_count, align 4, !dbg !191
  %cmp3 = icmp slt i32 %5, %6, !dbg !192
  br label %lor.end, !dbg !189

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %7 = phi i1 [ true, %while.cond ], [ %cmp3, %lor.rhs ]
  br i1 %7, label %while.body, label %while.end, !dbg !185

while.body:                                       ; preds = %lor.end
  %8 = load i32, i32* %i, align 4, !dbg !193
  %9 = load i32, i32* %orig_count, align 4, !dbg !194
  %cmp4 = icmp slt i32 %8, %9, !dbg !195
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !196

land.lhs.true:                                    ; preds = %while.body
  %10 = load i32, i32* %j, align 4, !dbg !197
  %11 = load i32, i32* %mod_count, align 4, !dbg !198
  %cmp5 = icmp slt i32 %10, %11, !dbg !199
  br i1 %cmp5, label %land.lhs.true6, label %if.else, !dbg !200

land.lhs.true6:                                   ; preds = %land.lhs.true
  %12 = load i8**, i8*** %orig_lines, align 8, !dbg !201
  %13 = load i32, i32* %i, align 4, !dbg !202
  %idxprom = sext i32 %13 to i64, !dbg !201
  %arrayidx = getelementptr inbounds i8*, i8** %12, i64 %idxprom, !dbg !201
  %14 = load i8*, i8** %arrayidx, align 8, !dbg !201
  %15 = load i8**, i8*** %mod_lines, align 8, !dbg !203
  %16 = load i32, i32* %j, align 4, !dbg !204
  %idxprom7 = sext i32 %16 to i64, !dbg !203
  %arrayidx8 = getelementptr inbounds i8*, i8** %15, i64 %idxprom7, !dbg !203
  %17 = load i8*, i8** %arrayidx8, align 8, !dbg !203
  %call9 = call i32 @strcmp(i8* noundef %14, i8* noundef %17) #7, !dbg !205
  %cmp10 = icmp eq i32 %call9, 0, !dbg !206
  br i1 %cmp10, label %if.then11, label %if.else, !dbg !193

if.then11:                                        ; preds = %land.lhs.true6
  %18 = load i32, i32* %i, align 4, !dbg !207
  %inc = add nsw i32 %18, 1, !dbg !207
  store i32 %inc, i32* %i, align 4, !dbg !207
  %19 = load i32, i32* %j, align 4, !dbg !208
  %inc12 = add nsw i32 %19, 1, !dbg !208
  store i32 %inc12, i32* %j, align 4, !dbg !208
  br label %if.end51, !dbg !209

if.else:                                          ; preds = %land.lhs.true6, %land.lhs.true, %while.body
  %20 = load i32, i32* %orig_count, align 4, !dbg !210
  store i32 %20, i32* %next_i, align 4, !dbg !211
  %21 = load i32, i32* %mod_count, align 4, !dbg !212
  store i32 %21, i32* %next_j, align 4, !dbg !213
  store i8 0, i8* %found, align 1, !dbg !214
  %22 = load i32, i32* %i, align 4, !dbg !215
  store i32 %22, i32* %k, align 4, !dbg !216
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc27, %if.else
  %23 = load i32, i32* %k, align 4, !dbg !218
  %24 = load i32, i32* %orig_count, align 4, !dbg !219
  %cmp13 = icmp slt i32 %23, %24, !dbg !220
  br i1 %cmp13, label %land.rhs, label %land.end, !dbg !221

land.rhs:                                         ; preds = %for.cond
  %25 = load i8, i8* %found, align 1, !dbg !222
  %tobool14 = trunc i8 %25 to i1, !dbg !222
  %lnot = xor i1 %tobool14, true, !dbg !223
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %26 = phi i1 [ false, %for.cond ], [ %lnot, %land.rhs ], !dbg !224
  br i1 %26, label %for.body, label %for.end29, !dbg !225

for.body:                                         ; preds = %land.end
  %27 = load i32, i32* %j, align 4, !dbg !226
  store i32 %27, i32* %l, align 4, !dbg !227
  br label %for.cond15, !dbg !228

for.cond15:                                       ; preds = %for.inc, %for.body
  %28 = load i32, i32* %l, align 4, !dbg !229
  %29 = load i32, i32* %mod_count, align 4, !dbg !230
  %cmp16 = icmp slt i32 %28, %29, !dbg !231
  br i1 %cmp16, label %for.body17, label %for.end, !dbg !232

for.body17:                                       ; preds = %for.cond15
  %30 = load i8**, i8*** %orig_lines, align 8, !dbg !233
  %31 = load i32, i32* %k, align 4, !dbg !234
  %idxprom18 = sext i32 %31 to i64, !dbg !233
  %arrayidx19 = getelementptr inbounds i8*, i8** %30, i64 %idxprom18, !dbg !233
  %32 = load i8*, i8** %arrayidx19, align 8, !dbg !233
  %33 = load i8**, i8*** %mod_lines, align 8, !dbg !235
  %34 = load i32, i32* %l, align 4, !dbg !236
  %idxprom20 = sext i32 %34 to i64, !dbg !235
  %arrayidx21 = getelementptr inbounds i8*, i8** %33, i64 %idxprom20, !dbg !235
  %35 = load i8*, i8** %arrayidx21, align 8, !dbg !235
  %call22 = call i32 @strcmp(i8* noundef %32, i8* noundef %35) #7, !dbg !237
  %cmp23 = icmp eq i32 %call22, 0, !dbg !238
  br i1 %cmp23, label %if.then24, label %if.end25, !dbg !237

if.then24:                                        ; preds = %for.body17
  %36 = load i32, i32* %k, align 4, !dbg !239
  store i32 %36, i32* %next_i, align 4, !dbg !240
  %37 = load i32, i32* %l, align 4, !dbg !241
  store i32 %37, i32* %next_j, align 4, !dbg !242
  store i8 1, i8* %found, align 1, !dbg !243
  br label %for.end, !dbg !244

if.end25:                                         ; preds = %for.body17
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %if.end25
  %38 = load i32, i32* %l, align 4, !dbg !246
  %inc26 = add nsw i32 %38, 1, !dbg !246
  store i32 %inc26, i32* %l, align 4, !dbg !246
  br label %for.cond15, !dbg !232, !llvm.loop !247

for.end:                                          ; preds = %if.then24, %for.cond15
  br label %for.inc27, !dbg !248

for.inc27:                                        ; preds = %for.end
  %39 = load i32, i32* %k, align 4, !dbg !249
  %inc28 = add nsw i32 %39, 1, !dbg !249
  store i32 %inc28, i32* %k, align 4, !dbg !249
  br label %for.cond, !dbg !225, !llvm.loop !250

for.end29:                                        ; preds = %land.end
  %40 = load i8, i8* %found, align 1, !dbg !251
  %tobool30 = trunc i8 %40 to i1, !dbg !251
  br i1 %tobool30, label %if.then31, label %if.else40, !dbg !251

if.then31:                                        ; preds = %for.end29
  %41 = load i32, i32* %i, align 4, !dbg !252
  store i32 %41, i32* %k32, align 4, !dbg !253
  br label %for.cond33, !dbg !254

for.cond33:                                       ; preds = %for.inc37, %if.then31
  %42 = load i32, i32* %k32, align 4, !dbg !255
  %43 = load i32, i32* %next_i, align 4, !dbg !256
  %cmp34 = icmp slt i32 %42, %43, !dbg !257
  br i1 %cmp34, label %for.body35, label %for.end39, !dbg !258

for.body35:                                       ; preds = %for.cond33
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %output_file, align 8, !dbg !259
  %45 = load i32, i32* %k32, align 4, !dbg !260
  %add = add nsw i32 %45, 1, !dbg !261
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %44, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i32 noundef %add), !dbg !262
  br label %for.inc37, !dbg !263

for.inc37:                                        ; preds = %for.body35
  %46 = load i32, i32* %k32, align 4, !dbg !264
  %inc38 = add nsw i32 %46, 1, !dbg !264
  store i32 %inc38, i32* %k32, align 4, !dbg !264
  br label %for.cond33, !dbg !258, !llvm.loop !265

for.end39:                                        ; preds = %for.cond33
  %47 = load i32, i32* %next_i, align 4, !dbg !266
  store i32 %47, i32* %i, align 4, !dbg !267
  %48 = load i32, i32* %next_j, align 4, !dbg !268
  store i32 %48, i32* %j, align 4, !dbg !269
  br label %if.end50, !dbg !270

if.else40:                                        ; preds = %for.end29
  %49 = load i32, i32* %i, align 4, !dbg !271
  store i32 %49, i32* %k41, align 4, !dbg !272
  br label %for.cond42, !dbg !273

for.cond42:                                       ; preds = %for.inc47, %if.else40
  %50 = load i32, i32* %k41, align 4, !dbg !274
  %51 = load i32, i32* %orig_count, align 4, !dbg !275
  %cmp43 = icmp slt i32 %50, %51, !dbg !276
  br i1 %cmp43, label %for.body44, label %for.end49, !dbg !277

for.body44:                                       ; preds = %for.cond42
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %output_file, align 8, !dbg !278
  %53 = load i32, i32* %k41, align 4, !dbg !279
  %add45 = add nsw i32 %53, 1, !dbg !280
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %52, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i32 noundef %add45), !dbg !281
  br label %for.inc47, !dbg !282

for.inc47:                                        ; preds = %for.body44
  %54 = load i32, i32* %k41, align 4, !dbg !283
  %inc48 = add nsw i32 %54, 1, !dbg !283
  store i32 %inc48, i32* %k41, align 4, !dbg !283
  br label %for.cond42, !dbg !277, !llvm.loop !284

for.end49:                                        ; preds = %for.cond42
  br label %while.end, !dbg !285

if.end50:                                         ; preds = %for.end39
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then11
  br label %while.cond, !dbg !185, !llvm.loop !286

while.end:                                        ; preds = %for.end49, %lor.end
  store i32 0, i32* %k52, align 4, !dbg !288
  br label %for.cond53, !dbg !289

for.cond53:                                       ; preds = %for.inc58, %while.end
  %55 = load i32, i32* %k52, align 4, !dbg !290
  %56 = load i32, i32* %orig_count, align 4, !dbg !291
  %cmp54 = icmp slt i32 %55, %56, !dbg !292
  br i1 %cmp54, label %for.body55, label %for.end60, !dbg !293

for.body55:                                       ; preds = %for.cond53
  %57 = load i8**, i8*** %orig_lines, align 8, !dbg !294
  %58 = load i32, i32* %k52, align 4, !dbg !295
  %idxprom56 = sext i32 %58 to i64, !dbg !294
  %arrayidx57 = getelementptr inbounds i8*, i8** %57, i64 %idxprom56, !dbg !294
  %59 = load i8*, i8** %arrayidx57, align 8, !dbg !294
  call void @free(i8* noundef %59) #11, !dbg !296
  br label %for.inc58, !dbg !296

for.inc58:                                        ; preds = %for.body55
  %60 = load i32, i32* %k52, align 4, !dbg !297
  %inc59 = add nsw i32 %60, 1, !dbg !297
  store i32 %inc59, i32* %k52, align 4, !dbg !297
  br label %for.cond53, !dbg !293, !llvm.loop !298

for.end60:                                        ; preds = %for.cond53
  %61 = load i8**, i8*** %orig_lines, align 8, !dbg !300
  %62 = bitcast i8** %61 to i8*, !dbg !300
  call void @free(i8* noundef %62) #11, !dbg !301
  store i32 0, i32* %k61, align 4, !dbg !302
  br label %for.cond62, !dbg !303

for.cond62:                                       ; preds = %for.inc67, %for.end60
  %63 = load i32, i32* %k61, align 4, !dbg !304
  %64 = load i32, i32* %mod_count, align 4, !dbg !305
  %cmp63 = icmp slt i32 %63, %64, !dbg !306
  br i1 %cmp63, label %for.body64, label %for.end69, !dbg !307

for.body64:                                       ; preds = %for.cond62
  %65 = load i8**, i8*** %mod_lines, align 8, !dbg !308
  %66 = load i32, i32* %k61, align 4, !dbg !309
  %idxprom65 = sext i32 %66 to i64, !dbg !308
  %arrayidx66 = getelementptr inbounds i8*, i8** %65, i64 %idxprom65, !dbg !308
  %67 = load i8*, i8** %arrayidx66, align 8, !dbg !308
  call void @free(i8* noundef %67) #11, !dbg !310
  br label %for.inc67, !dbg !310

for.inc67:                                        ; preds = %for.body64
  %68 = load i32, i32* %k61, align 4, !dbg !311
  %inc68 = add nsw i32 %68, 1, !dbg !311
  store i32 %inc68, i32* %k61, align 4, !dbg !311
  br label %for.cond62, !dbg !307, !llvm.loop !312

for.end69:                                        ; preds = %for.cond62
  %69 = load i8**, i8*** %mod_lines, align 8, !dbg !314
  %70 = bitcast i8** %69 to i8*, !dbg !314
  call void @free(i8* noundef %70) #11, !dbg !315
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** %output_file, align 8, !dbg !316
  %call70 = call i32 @fclose(%struct._IO_FILE* noundef %71), !dbg !317
  ret void, !dbg !318
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strcmp(i8* noundef, i8* noundef) #1

declare dso_local i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #3

; Function Attrs: nounwind
declare dso_local void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !319 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4, !dbg !320
  %cmp = icmp ne i32 %0, 3, !dbg !321
  br i1 %cmp, label %if.then, label %if.end, !dbg !320

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !322
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !323
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0, !dbg !323
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !323
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i64 0, i64 0), i8* noundef %3), !dbg !324
  store i32 1, i32* %retval, align 4, !dbg !325
  br label %return, !dbg !325

if.end:                                           ; preds = %entry
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !326
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i64 1, !dbg !326
  %5 = load i8*, i8** %arrayidx1, align 8, !dbg !326
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !327
  %arrayidx2 = getelementptr inbounds i8*, i8** %6, i64 2, !dbg !327
  %7 = load i8*, i8** %arrayidx2, align 8, !dbg !327
  call void @compare_files(i8* noundef %5, i8* noundef %7), !dbg !328
  store i32 0, i32* %retval, align 4, !dbg !329
  br label %return, !dbg !329

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, i32* %retval, align 4, !dbg !330
  ret i32 %8, !dbg !330
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign_c/file_comparator.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "0e08fadc89d29b18782c0eea119be71e")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!8 = distinct !DISubprogram(name: "clean_line", scope: !9, file: !9, line: 10, type: !10, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!9 = !DIFile(filename: "./assign_c//file_comparator.c", directory: "/home/rohith/Desktop/8SemMat/ipaco/llvm-project/project", checksumkind: CSK_MD5, checksum: "0e08fadc89d29b18782c0eea119be71e")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 11, column: 10, scope: !8)
!13 = !DILocation(line: 12, column: 15, scope: !8)
!14 = !DILocation(line: 12, column: 11, scope: !8)
!15 = !DILocation(line: 13, column: 20, scope: !8)
!16 = !DILocation(line: 13, column: 11, scope: !8)
!17 = !DILocation(line: 14, column: 10, scope: !8)
!18 = !DILocation(line: 16, column: 5, scope: !8)
!19 = !DILocation(line: 16, column: 13, scope: !8)
!20 = !DILocation(line: 16, column: 12, scope: !8)
!21 = !DILocation(line: 16, column: 15, scope: !8)
!22 = !DILocation(line: 17, column: 14, scope: !8)
!23 = !DILocation(line: 17, column: 31, scope: !8)
!24 = !DILocation(line: 17, column: 35, scope: !8)
!25 = !DILocation(line: 17, column: 13, scope: !8)
!26 = !DILocation(line: 18, column: 18, scope: !8)
!27 = !DILocation(line: 18, column: 17, scope: !8)
!28 = !DILocation(line: 18, column: 20, scope: !8)
!29 = !DILocation(line: 18, column: 27, scope: !8)
!30 = !DILocation(line: 18, column: 32, scope: !8)
!31 = !DILocation(line: 18, column: 33, scope: !8)
!32 = !DILocation(line: 18, column: 30, scope: !8)
!33 = !DILocation(line: 18, column: 37, scope: !8)
!34 = !DILocation(line: 19, column: 34, scope: !8)
!35 = !DILocation(line: 20, column: 19, scope: !8)
!36 = !DILocation(line: 21, column: 17, scope: !8)
!37 = distinct !{!37, !18, !38, !39}
!38 = !DILocation(line: 44, column: 5, scope: !8)
!39 = !{!"llvm.loop.mustprogress"}
!40 = !DILocation(line: 22, column: 25, scope: !8)
!41 = !DILocation(line: 22, column: 24, scope: !8)
!42 = !DILocation(line: 22, column: 27, scope: !8)
!43 = !DILocation(line: 22, column: 34, scope: !8)
!44 = !DILocation(line: 22, column: 39, scope: !8)
!45 = !DILocation(line: 22, column: 40, scope: !8)
!46 = !DILocation(line: 22, column: 37, scope: !8)
!47 = !DILocation(line: 22, column: 44, scope: !8)
!48 = !DILocation(line: 23, column: 18, scope: !8)
!49 = !DILocation(line: 23, column: 25, scope: !8)
!50 = !DILocation(line: 24, column: 17, scope: !8)
!51 = !DILocation(line: 25, column: 25, scope: !8)
!52 = !DILocation(line: 25, column: 24, scope: !8)
!53 = !DILocation(line: 25, column: 27, scope: !8)
!54 = !DILocation(line: 26, column: 27, scope: !8)
!55 = !DILocation(line: 27, column: 13, scope: !8)
!56 = !DILocation(line: 28, column: 9, scope: !8)
!57 = !DILocation(line: 28, column: 20, scope: !8)
!58 = !DILocation(line: 29, column: 18, scope: !8)
!59 = !DILocation(line: 29, column: 17, scope: !8)
!60 = !DILocation(line: 29, column: 20, scope: !8)
!61 = !DILocation(line: 29, column: 27, scope: !8)
!62 = !DILocation(line: 29, column: 32, scope: !8)
!63 = !DILocation(line: 29, column: 33, scope: !8)
!64 = !DILocation(line: 29, column: 30, scope: !8)
!65 = !DILocation(line: 29, column: 37, scope: !8)
!66 = !DILocation(line: 30, column: 34, scope: !8)
!67 = !DILocation(line: 31, column: 19, scope: !8)
!68 = !DILocation(line: 32, column: 17, scope: !8)
!69 = !DILocation(line: 34, column: 9, scope: !8)
!70 = !DILocation(line: 34, column: 20, scope: !8)
!71 = !DILocation(line: 35, column: 18, scope: !8)
!72 = !DILocation(line: 35, column: 17, scope: !8)
!73 = !DILocation(line: 35, column: 20, scope: !8)
!74 = !DILocation(line: 35, column: 27, scope: !8)
!75 = !DILocation(line: 35, column: 32, scope: !8)
!76 = !DILocation(line: 35, column: 33, scope: !8)
!77 = !DILocation(line: 35, column: 30, scope: !8)
!78 = !DILocation(line: 35, column: 37, scope: !8)
!79 = !DILocation(line: 36, column: 27, scope: !8)
!80 = !DILocation(line: 37, column: 13, scope: !8)
!81 = !DILocation(line: 38, column: 9, scope: !8)
!82 = !DILocation(line: 40, column: 14, scope: !8)
!83 = !DILocation(line: 40, column: 13, scope: !8)
!84 = !DILocation(line: 41, column: 26, scope: !8)
!85 = !DILocation(line: 41, column: 25, scope: !8)
!86 = !DILocation(line: 41, column: 20, scope: !8)
!87 = !DILocation(line: 41, column: 23, scope: !8)
!88 = !DILocation(line: 42, column: 9, scope: !8)
!89 = !DILocation(line: 43, column: 10, scope: !8)
!90 = !DILocation(line: 45, column: 6, scope: !8)
!91 = !DILocation(line: 45, column: 13, scope: !8)
!92 = !DILocation(line: 48, column: 22, scope: !8)
!93 = !DILocation(line: 48, column: 15, scope: !8)
!94 = !DILocation(line: 48, column: 9, scope: !8)
!95 = !DILocation(line: 49, column: 5, scope: !8)
!96 = !DILocation(line: 49, column: 12, scope: !8)
!97 = !DILocation(line: 49, column: 16, scope: !8)
!98 = !DILocation(line: 49, column: 20, scope: !8)
!99 = !DILocation(line: 49, column: 23, scope: !8)
!100 = !DILocation(line: 0, scope: !8)
!101 = !DILocation(line: 50, column: 9, scope: !8)
!102 = !DILocation(line: 50, column: 14, scope: !8)
!103 = !DILocation(line: 50, column: 21, scope: !8)
!104 = distinct !{!104, !95, !105, !39}
!105 = !DILocation(line: 51, column: 5, scope: !8)
!106 = !DILocation(line: 52, column: 1, scope: !8)
!107 = distinct !DISubprogram(name: "read_lines", scope: !9, file: !9, line: 55, type: !10, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!108 = !DILocation(line: 56, column: 24, scope: !107)
!109 = !DILocation(line: 56, column: 18, scope: !107)
!110 = !DILocation(line: 56, column: 11, scope: !107)
!111 = !DILocation(line: 57, column: 10, scope: !107)
!112 = !DILocation(line: 57, column: 9, scope: !107)
!113 = !DILocation(line: 58, column: 9, scope: !107)
!114 = !DILocation(line: 59, column: 9, scope: !107)
!115 = !DILocation(line: 62, column: 12, scope: !107)
!116 = !DILocation(line: 64, column: 9, scope: !107)
!117 = !DILocation(line: 65, column: 6, scope: !107)
!118 = !DILocation(line: 65, column: 17, scope: !107)
!119 = !DILocation(line: 67, column: 20, scope: !107)
!120 = !DILocation(line: 67, column: 29, scope: !107)
!121 = !DILocation(line: 67, column: 13, scope: !107)
!122 = !DILocation(line: 67, column: 11, scope: !107)
!123 = !DILocation(line: 68, column: 10, scope: !107)
!124 = !DILocation(line: 68, column: 9, scope: !107)
!125 = !DILocation(line: 69, column: 9, scope: !107)
!126 = !DILocation(line: 70, column: 9, scope: !107)
!127 = !DILocation(line: 73, column: 5, scope: !107)
!128 = !DILocation(line: 73, column: 18, scope: !107)
!129 = !DILocation(line: 73, column: 43, scope: !107)
!130 = !DILocation(line: 73, column: 12, scope: !107)
!131 = !DILocation(line: 74, column: 14, scope: !107)
!132 = !DILocation(line: 74, column: 13, scope: !107)
!133 = !DILocation(line: 74, column: 28, scope: !107)
!134 = !DILocation(line: 74, column: 25, scope: !107)
!135 = !DILocation(line: 75, column: 22, scope: !107)
!136 = !DILocation(line: 76, column: 40, scope: !107)
!137 = !DILocation(line: 76, column: 47, scope: !107)
!138 = !DILocation(line: 76, column: 56, scope: !107)
!139 = !DILocation(line: 76, column: 32, scope: !107)
!140 = !DILocation(line: 76, column: 20, scope: !107)
!141 = !DILocation(line: 77, column: 18, scope: !107)
!142 = !DILocation(line: 77, column: 17, scope: !107)
!143 = !DILocation(line: 78, column: 17, scope: !107)
!144 = !DILocation(line: 79, column: 17, scope: !107)
!145 = !DILocation(line: 81, column: 21, scope: !107)
!146 = !DILocation(line: 81, column: 19, scope: !107)
!147 = !DILocation(line: 82, column: 9, scope: !107)
!148 = !DILocation(line: 85, column: 20, scope: !107)
!149 = !DILocation(line: 85, column: 9, scope: !107)
!150 = !DILocation(line: 86, column: 37, scope: !107)
!151 = !DILocation(line: 86, column: 30, scope: !107)
!152 = !DILocation(line: 86, column: 9, scope: !107)
!153 = !DILocation(line: 86, column: 16, scope: !107)
!154 = !DILocation(line: 86, column: 15, scope: !107)
!155 = !DILocation(line: 86, column: 28, scope: !107)
!156 = !DILocation(line: 87, column: 14, scope: !107)
!157 = !DILocation(line: 87, column: 21, scope: !107)
!158 = !DILocation(line: 87, column: 20, scope: !107)
!159 = !DILocation(line: 87, column: 13, scope: !107)
!160 = !DILocation(line: 88, column: 13, scope: !107)
!161 = !DILocation(line: 89, column: 13, scope: !107)
!162 = !DILocation(line: 91, column: 11, scope: !107)
!163 = !DILocation(line: 91, column: 22, scope: !107)
!164 = distinct !{!164, !127, !165, !39}
!165 = !DILocation(line: 92, column: 5, scope: !107)
!166 = !DILocation(line: 94, column: 12, scope: !107)
!167 = !DILocation(line: 94, column: 5, scope: !107)
!168 = !DILocation(line: 95, column: 12, scope: !107)
!169 = !DILocation(line: 95, column: 5, scope: !107)
!170 = distinct !DISubprogram(name: "compare_files", scope: !9, file: !9, line: 98, type: !10, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!171 = !DILocation(line: 99, column: 25, scope: !170)
!172 = !DILocation(line: 99, column: 11, scope: !170)
!173 = !DILocation(line: 100, column: 10, scope: !170)
!174 = !DILocation(line: 100, column: 9, scope: !170)
!175 = !DILocation(line: 101, column: 9, scope: !170)
!176 = !DILocation(line: 102, column: 9, scope: !170)
!177 = !DILocation(line: 106, column: 36, scope: !170)
!178 = !DILocation(line: 106, column: 25, scope: !170)
!179 = !DILocation(line: 106, column: 12, scope: !170)
!180 = !DILocation(line: 107, column: 35, scope: !170)
!181 = !DILocation(line: 107, column: 24, scope: !170)
!182 = !DILocation(line: 107, column: 12, scope: !170)
!183 = !DILocation(line: 109, column: 9, scope: !170)
!184 = !DILocation(line: 109, column: 16, scope: !170)
!185 = !DILocation(line: 110, column: 5, scope: !170)
!186 = !DILocation(line: 110, column: 12, scope: !170)
!187 = !DILocation(line: 110, column: 16, scope: !170)
!188 = !DILocation(line: 110, column: 14, scope: !170)
!189 = !DILocation(line: 110, column: 27, scope: !170)
!190 = !DILocation(line: 110, column: 30, scope: !170)
!191 = !DILocation(line: 110, column: 34, scope: !170)
!192 = !DILocation(line: 110, column: 32, scope: !170)
!193 = !DILocation(line: 111, column: 13, scope: !170)
!194 = !DILocation(line: 111, column: 17, scope: !170)
!195 = !DILocation(line: 111, column: 15, scope: !170)
!196 = !DILocation(line: 111, column: 28, scope: !170)
!197 = !DILocation(line: 111, column: 31, scope: !170)
!198 = !DILocation(line: 111, column: 35, scope: !170)
!199 = !DILocation(line: 111, column: 33, scope: !170)
!200 = !DILocation(line: 111, column: 45, scope: !170)
!201 = !DILocation(line: 111, column: 55, scope: !170)
!202 = !DILocation(line: 111, column: 66, scope: !170)
!203 = !DILocation(line: 111, column: 70, scope: !170)
!204 = !DILocation(line: 111, column: 80, scope: !170)
!205 = !DILocation(line: 111, column: 48, scope: !170)
!206 = !DILocation(line: 111, column: 84, scope: !170)
!207 = !DILocation(line: 112, column: 14, scope: !170)
!208 = !DILocation(line: 113, column: 14, scope: !170)
!209 = !DILocation(line: 114, column: 9, scope: !170)
!210 = !DILocation(line: 116, column: 26, scope: !170)
!211 = !DILocation(line: 116, column: 17, scope: !170)
!212 = !DILocation(line: 117, column: 26, scope: !170)
!213 = !DILocation(line: 117, column: 17, scope: !170)
!214 = !DILocation(line: 118, column: 18, scope: !170)
!215 = !DILocation(line: 120, column: 26, scope: !170)
!216 = !DILocation(line: 120, column: 22, scope: !170)
!217 = !DILocation(line: 120, column: 18, scope: !170)
!218 = !DILocation(line: 120, column: 29, scope: !170)
!219 = !DILocation(line: 120, column: 33, scope: !170)
!220 = !DILocation(line: 120, column: 31, scope: !170)
!221 = !DILocation(line: 120, column: 44, scope: !170)
!222 = !DILocation(line: 120, column: 48, scope: !170)
!223 = !DILocation(line: 120, column: 47, scope: !170)
!224 = !DILocation(line: 0, scope: !170)
!225 = !DILocation(line: 120, column: 13, scope: !170)
!226 = !DILocation(line: 121, column: 30, scope: !170)
!227 = !DILocation(line: 121, column: 26, scope: !170)
!228 = !DILocation(line: 121, column: 22, scope: !170)
!229 = !DILocation(line: 121, column: 33, scope: !170)
!230 = !DILocation(line: 121, column: 37, scope: !170)
!231 = !DILocation(line: 121, column: 35, scope: !170)
!232 = !DILocation(line: 121, column: 17, scope: !170)
!233 = !DILocation(line: 122, column: 32, scope: !170)
!234 = !DILocation(line: 122, column: 43, scope: !170)
!235 = !DILocation(line: 122, column: 47, scope: !170)
!236 = !DILocation(line: 122, column: 57, scope: !170)
!237 = !DILocation(line: 122, column: 25, scope: !170)
!238 = !DILocation(line: 122, column: 61, scope: !170)
!239 = !DILocation(line: 123, column: 34, scope: !170)
!240 = !DILocation(line: 123, column: 32, scope: !170)
!241 = !DILocation(line: 124, column: 34, scope: !170)
!242 = !DILocation(line: 124, column: 32, scope: !170)
!243 = !DILocation(line: 125, column: 31, scope: !170)
!244 = !DILocation(line: 126, column: 25, scope: !170)
!245 = !DILocation(line: 128, column: 17, scope: !170)
!246 = !DILocation(line: 121, column: 49, scope: !170)
!247 = distinct !{!247, !232, !245, !39}
!248 = !DILocation(line: 129, column: 13, scope: !170)
!249 = !DILocation(line: 120, column: 56, scope: !170)
!250 = distinct !{!250, !225, !248, !39}
!251 = !DILocation(line: 131, column: 17, scope: !170)
!252 = !DILocation(line: 133, column: 30, scope: !170)
!253 = !DILocation(line: 133, column: 26, scope: !170)
!254 = !DILocation(line: 133, column: 22, scope: !170)
!255 = !DILocation(line: 133, column: 33, scope: !170)
!256 = !DILocation(line: 133, column: 37, scope: !170)
!257 = !DILocation(line: 133, column: 35, scope: !170)
!258 = !DILocation(line: 133, column: 17, scope: !170)
!259 = !DILocation(line: 134, column: 29, scope: !170)
!260 = !DILocation(line: 134, column: 50, scope: !170)
!261 = !DILocation(line: 134, column: 52, scope: !170)
!262 = !DILocation(line: 134, column: 21, scope: !170)
!263 = !DILocation(line: 135, column: 17, scope: !170)
!264 = !DILocation(line: 133, column: 46, scope: !170)
!265 = distinct !{!265, !258, !263, !39}
!266 = !DILocation(line: 136, column: 21, scope: !170)
!267 = !DILocation(line: 136, column: 19, scope: !170)
!268 = !DILocation(line: 137, column: 21, scope: !170)
!269 = !DILocation(line: 137, column: 19, scope: !170)
!270 = !DILocation(line: 138, column: 13, scope: !170)
!271 = !DILocation(line: 140, column: 30, scope: !170)
!272 = !DILocation(line: 140, column: 26, scope: !170)
!273 = !DILocation(line: 140, column: 22, scope: !170)
!274 = !DILocation(line: 140, column: 33, scope: !170)
!275 = !DILocation(line: 140, column: 37, scope: !170)
!276 = !DILocation(line: 140, column: 35, scope: !170)
!277 = !DILocation(line: 140, column: 17, scope: !170)
!278 = !DILocation(line: 141, column: 29, scope: !170)
!279 = !DILocation(line: 141, column: 50, scope: !170)
!280 = !DILocation(line: 141, column: 52, scope: !170)
!281 = !DILocation(line: 141, column: 21, scope: !170)
!282 = !DILocation(line: 142, column: 17, scope: !170)
!283 = !DILocation(line: 140, column: 50, scope: !170)
!284 = distinct !{!284, !277, !282, !39}
!285 = !DILocation(line: 143, column: 17, scope: !170)
!286 = distinct !{!286, !185, !287, !39}
!287 = !DILocation(line: 146, column: 5, scope: !170)
!288 = !DILocation(line: 149, column: 14, scope: !170)
!289 = !DILocation(line: 149, column: 10, scope: !170)
!290 = !DILocation(line: 149, column: 21, scope: !170)
!291 = !DILocation(line: 149, column: 25, scope: !170)
!292 = !DILocation(line: 149, column: 23, scope: !170)
!293 = !DILocation(line: 149, column: 5, scope: !170)
!294 = !DILocation(line: 149, column: 47, scope: !170)
!295 = !DILocation(line: 149, column: 58, scope: !170)
!296 = !DILocation(line: 149, column: 42, scope: !170)
!297 = !DILocation(line: 149, column: 38, scope: !170)
!298 = distinct !{!298, !293, !299, !39}
!299 = !DILocation(line: 149, column: 60, scope: !170)
!300 = !DILocation(line: 150, column: 10, scope: !170)
!301 = !DILocation(line: 150, column: 5, scope: !170)
!302 = !DILocation(line: 151, column: 14, scope: !170)
!303 = !DILocation(line: 151, column: 10, scope: !170)
!304 = !DILocation(line: 151, column: 21, scope: !170)
!305 = !DILocation(line: 151, column: 25, scope: !170)
!306 = !DILocation(line: 151, column: 23, scope: !170)
!307 = !DILocation(line: 151, column: 5, scope: !170)
!308 = !DILocation(line: 151, column: 46, scope: !170)
!309 = !DILocation(line: 151, column: 56, scope: !170)
!310 = !DILocation(line: 151, column: 41, scope: !170)
!311 = !DILocation(line: 151, column: 37, scope: !170)
!312 = distinct !{!312, !307, !313, !39}
!313 = !DILocation(line: 151, column: 58, scope: !170)
!314 = !DILocation(line: 152, column: 10, scope: !170)
!315 = !DILocation(line: 152, column: 5, scope: !170)
!316 = !DILocation(line: 153, column: 12, scope: !170)
!317 = !DILocation(line: 153, column: 5, scope: !170)
!318 = !DILocation(line: 154, column: 1, scope: !170)
!319 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 156, type: !10, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !11)
!320 = !DILocation(line: 157, column: 9, scope: !319)
!321 = !DILocation(line: 157, column: 14, scope: !319)
!322 = !DILocation(line: 158, column: 17, scope: !319)
!323 = !DILocation(line: 158, column: 72, scope: !319)
!324 = !DILocation(line: 158, column: 9, scope: !319)
!325 = !DILocation(line: 159, column: 9, scope: !319)
!326 = !DILocation(line: 162, column: 19, scope: !319)
!327 = !DILocation(line: 162, column: 28, scope: !319)
!328 = !DILocation(line: 162, column: 5, scope: !319)
!329 = !DILocation(line: 164, column: 5, scope: !319)
!330 = !DILocation(line: 165, column: 1, scope: !319)
