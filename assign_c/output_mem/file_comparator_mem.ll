; ModuleID = '<stdin>'
source_filename = "./assign_c/file_comparator.c"
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @clean_line(i8* noundef %line) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end60, %if.then39, %if.then10, %entry
  %in_string.0 = phi i8 [ 0, %entry ], [ %in_string.0, %if.then39 ], [ %in_string.5, %if.end60 ], [ %in_string.0, %if.then10 ]
  %output.0 = phi i8* [ %line, %entry ], [ %output.0, %if.then39 ], [ %output.1, %if.end60 ], [ %output.0, %if.then10 ]
  %p.0 = phi i8* [ %line, %entry ], [ %add.ptr40, %if.then39 ], [ %incdec.ptr61, %if.end60 ], [ %add.ptr11, %if.then10 ]
  %in_block_comment.0 = phi i8 [ 0, %entry ], [ 0, %if.then39 ], [ %in_block_comment.0, %if.end60 ], [ 1, %if.then10 ]
  %0 = load i8, i8* %p.0, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tobool = trunc i8 %in_block_comment.0 to i1
  br i1 %tobool, label %if.else28, label %land.lhs.true

land.lhs.true:                                    ; preds = %while.body
  %tobool2 = trunc i8 %in_string.0 to i1
  br i1 %tobool2, label %if.else28, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %1 = load i8, i8* %p.0, align 1
  %conv3 = sext i8 %1 to i32
  %cmp4 = icmp eq i32 %conv3, 47
  br i1 %cmp4, label %land.lhs.true6, label %if.else

land.lhs.true6:                                   ; preds = %if.then
  %add.ptr = getelementptr inbounds i8, i8* %p.0, i64 1
  %2 = load i8, i8* %add.ptr, align 1
  %conv7 = sext i8 %2 to i32
  %cmp8 = icmp eq i32 %conv7, 42
  br i1 %cmp8, label %if.then10, label %if.else

if.then10:                                        ; preds = %land.lhs.true6
  %add.ptr11 = getelementptr inbounds i8, i8* %p.0, i64 2
  br label %while.cond, !llvm.loop !4

if.else:                                          ; preds = %land.lhs.true6, %if.then
  %3 = load i8, i8* %p.0, align 1
  %conv12 = sext i8 %3 to i32
  %cmp13 = icmp eq i32 %conv12, 47
  br i1 %cmp13, label %land.lhs.true15, label %if.else21

land.lhs.true15:                                  ; preds = %if.else
  %add.ptr16 = getelementptr inbounds i8, i8* %p.0, i64 1
  %4 = load i8, i8* %add.ptr16, align 1
  %conv17 = sext i8 %4 to i32
  %cmp18 = icmp eq i32 %conv17, 47
  br i1 %cmp18, label %if.then20, label %if.else21

if.then20:                                        ; preds = %land.lhs.true15
  store i8 0, i8* %output.0, align 1
  br label %while.end

if.else21:                                        ; preds = %land.lhs.true15, %if.else
  %5 = load i8, i8* %p.0, align 1
  %conv22 = sext i8 %5 to i32
  %cmp23 = icmp eq i32 %conv22, 34
  br i1 %cmp23, label %if.then25, label %if.end

if.then25:                                        ; preds = %if.else21
  br label %if.end

if.end:                                           ; preds = %if.then25, %if.else21
  %in_string.1 = phi i8 [ 1, %if.then25 ], [ %in_string.0, %if.else21 ]
  br label %if.end26

if.end26:                                         ; preds = %if.end
  br label %if.end27

if.end27:                                         ; preds = %if.end26
  br label %if.end57

if.else28:                                        ; preds = %land.lhs.true, %while.body
  %tobool29 = trunc i8 %in_block_comment.0 to i1
  br i1 %tobool29, label %if.then30, label %if.else42

if.then30:                                        ; preds = %if.else28
  %6 = load i8, i8* %p.0, align 1
  %conv31 = sext i8 %6 to i32
  %cmp32 = icmp eq i32 %conv31, 42
  br i1 %cmp32, label %land.lhs.true34, label %if.end41

land.lhs.true34:                                  ; preds = %if.then30
  %add.ptr35 = getelementptr inbounds i8, i8* %p.0, i64 1
  %7 = load i8, i8* %add.ptr35, align 1
  %conv36 = sext i8 %7 to i32
  %cmp37 = icmp eq i32 %conv36, 47
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %land.lhs.true34
  %add.ptr40 = getelementptr inbounds i8, i8* %p.0, i64 2
  br label %while.cond, !llvm.loop !4

if.end41:                                         ; preds = %land.lhs.true34, %if.then30
  br label %if.end56

if.else42:                                        ; preds = %if.else28
  %tobool43 = trunc i8 %in_string.0 to i1
  br i1 %tobool43, label %if.then44, label %if.end55

if.then44:                                        ; preds = %if.else42
  %8 = load i8, i8* %p.0, align 1
  %conv45 = sext i8 %8 to i32
  %cmp46 = icmp eq i32 %conv45, 34
  br i1 %cmp46, label %land.lhs.true48, label %if.end54

land.lhs.true48:                                  ; preds = %if.then44
  %add.ptr49 = getelementptr inbounds i8, i8* %p.0, i64 -1
  %9 = load i8, i8* %add.ptr49, align 1
  %conv50 = sext i8 %9 to i32
  %cmp51 = icmp ne i32 %conv50, 92
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %land.lhs.true48
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %land.lhs.true48, %if.then44
  %in_string.2 = phi i8 [ 0, %if.then53 ], [ %in_string.0, %land.lhs.true48 ], [ %in_string.0, %if.then44 ]
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.else42
  %in_string.3 = phi i8 [ %in_string.2, %if.end54 ], [ %in_string.0, %if.else42 ]
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end41
  %in_string.4 = phi i8 [ %in_string.0, %if.end41 ], [ %in_string.3, %if.end55 ]
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end27
  %in_string.5 = phi i8 [ %in_string.4, %if.end56 ], [ %in_string.1, %if.end27 ]
  %tobool58 = trunc i8 %in_block_comment.0 to i1
  br i1 %tobool58, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end57
  %10 = load i8, i8* %p.0, align 1
  %incdec.ptr = getelementptr inbounds i8, i8* %output.0, i32 1
  store i8 %10, i8* %output.0, align 1
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.end57
  %output.1 = phi i8* [ %output.0, %if.end57 ], [ %incdec.ptr, %if.then59 ]
  %incdec.ptr61 = getelementptr inbounds i8, i8* %p.0, i32 1
  br label %while.cond, !llvm.loop !4

while.end:                                        ; preds = %if.then20, %while.cond
  store i8 0, i8* %output.0, align 1
  %call = call i64 @strlen(i8* noundef %line) #7
  %conv62 = trunc i64 %call to i32
  br label %while.cond63

while.cond63:                                     ; preds = %while.body72, %while.end
  %len.0 = phi i32 [ %conv62, %while.end ], [ %dec, %while.body72 ]
  %cmp64 = icmp sgt i32 %len.0, 0
  br i1 %cmp64, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond63
  %call66 = call i16** @__ctype_b_loc() #8
  %11 = load i16*, i16** %call66, align 8
  %sub = sub nsw i32 %len.0, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i8, i8* %line, i64 %idxprom
  %12 = load i8, i8* %arrayidx, align 1
  %conv67 = sext i8 %12 to i32
  %idxprom68 = sext i32 %conv67 to i64
  %arrayidx69 = getelementptr inbounds i16, i16* %11, i64 %idxprom68
  %13 = load i16, i16* %arrayidx69, align 2
  %conv70 = zext i16 %13 to i32
  %and = and i32 %conv70, 8192
  %tobool71 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond63
  %14 = phi i1 [ false, %while.cond63 ], [ %tobool71, %land.rhs ]
  br i1 %14, label %while.body72, label %while.end75

while.body72:                                     ; preds = %land.end
  %dec = add nsw i32 %len.0, -1
  %idxprom73 = sext i32 %dec to i64
  %arrayidx74 = getelementptr inbounds i8, i8* %line, i64 %idxprom73
  store i8 0, i8* %arrayidx74, align 1
  br label %while.cond63, !llvm.loop !6

while.end75:                                      ; preds = %land.end
  ret void
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8* noundef) #1

; Function Attrs: nounwind readnone willreturn
declare dso_local i16** @__ctype_b_loc() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8** @read_lines(i8* noundef %filename, i32* noundef %line_count) #0 {
entry:
  %buffer = alloca [1024 x i8], align 16
  %call = call noalias %struct._IO_FILE* @fopen(i8* noundef %filename, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %tobool = icmp ne %struct._IO_FILE* %call, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0)) #9
  call void @exit(i32 noundef 1) #10
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %line_count, align 4
  %conv = sext i32 10 to i64
  %mul = mul i64 %conv, 8
  %call1 = call noalias i8* @malloc(i64 noundef %mul) #11
  %0 = bitcast i8* %call1 to i8**
  %tobool2 = icmp ne i8** %0, null
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @perror(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i64 0, i64 0)) #9
  call void @exit(i32 noundef 1) #10
  unreachable

if.end4:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end24, %if.end4
  %lines.0 = phi i8** [ %0, %if.end4 ], [ %lines.1, %if.end24 ]
  %capacity.0 = phi i32 [ 10, %if.end4 ], [ %capacity.1, %if.end24 ]
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0
  %call5 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 1024, %struct._IO_FILE* noundef %call)
  %tobool6 = icmp ne i8* %call5, null
  br i1 %tobool6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %line_count, align 4
  %cmp = icmp sge i32 %1, %capacity.0
  br i1 %cmp, label %if.then8, label %if.end16

if.then8:                                         ; preds = %while.body
  %mul9 = mul nsw i32 %capacity.0, 2
  %2 = bitcast i8** %lines.0 to i8*
  %conv10 = sext i32 %mul9 to i64
  %mul11 = mul i64 %conv10, 8
  %call12 = call i8* @realloc(i8* noundef %2, i64 noundef %mul11) #11
  %3 = bitcast i8* %call12 to i8**
  %tobool13 = icmp ne i8** %3, null
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.then8
  call void @perror(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0)) #9
  call void @exit(i32 noundef 1) #10
  unreachable

if.end15:                                         ; preds = %if.then8
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %while.body
  %lines.1 = phi i8** [ %3, %if.end15 ], [ %lines.0, %while.body ]
  %capacity.1 = phi i32 [ %mul9, %if.end15 ], [ %capacity.0, %while.body ]
  %arraydecay17 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0
  call void @clean_line(i8* noundef %arraydecay17)
  %arraydecay18 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0
  %call19 = call noalias i8* @strdup(i8* noundef %arraydecay18) #11
  %4 = load i32, i32* %line_count, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %lines.1, i64 %idxprom
  store i8* %call19, i8** %arrayidx, align 8
  %5 = load i32, i32* %line_count, align 4
  %idxprom20 = sext i32 %5 to i64
  %arrayidx21 = getelementptr inbounds i8*, i8** %lines.1, i64 %idxprom20
  %6 = load i8*, i8** %arrayidx21, align 8
  %tobool22 = icmp ne i8* %6, null
  br i1 %tobool22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end16
  call void @perror(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0)) #9
  call void @exit(i32 noundef 1) #10
  unreachable

if.end24:                                         ; preds = %if.end16
  %7 = load i32, i32* %line_count, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %line_count, align 4
  br label %while.cond, !llvm.loop !7

while.end:                                        ; preds = %while.cond
  %call25 = call i32 @fclose(%struct._IO_FILE* noundef %call)
  ret i8** %lines.0
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @compare_files(i8* noundef %file1, i8* noundef %file2) #0 {
entry:
  %orig_count = alloca i32, align 4
  %mod_count = alloca i32, align 4
  %call = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0))
  %tobool = icmp ne %struct._IO_FILE* %call, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7, i64 0, i64 0)) #9
  call void @exit(i32 noundef 1) #10
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i8** @read_lines(i8* noundef %file1, i32* noundef %orig_count)
  %call2 = call i8** @read_lines(i8* noundef %file2, i32* noundef %mod_count)
  br label %while.cond

while.cond:                                       ; preds = %if.end51, %if.end
  %j.0 = phi i32 [ 0, %if.end ], [ %j.1, %if.end51 ]
  %i.0 = phi i32 [ 0, %if.end ], [ %i.1, %if.end51 ]
  %0 = load i32, i32* %orig_count, align 4
  %cmp = icmp slt i32 %i.0, %0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %1 = load i32, i32* %mod_count, align 4
  %cmp3 = icmp slt i32 %j.0, %1
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %2 = phi i1 [ true, %while.cond ], [ %cmp3, %lor.rhs ]
  br i1 %2, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %3 = load i32, i32* %orig_count, align 4
  %cmp4 = icmp slt i32 %i.0, %3
  br i1 %cmp4, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %4 = load i32, i32* %mod_count, align 4
  %cmp5 = icmp slt i32 %j.0, %4
  br i1 %cmp5, label %land.lhs.true6, label %if.else

land.lhs.true6:                                   ; preds = %land.lhs.true
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %call1, i64 %idxprom
  %5 = load i8*, i8** %arrayidx, align 8
  %idxprom7 = sext i32 %j.0 to i64
  %arrayidx8 = getelementptr inbounds i8*, i8** %call2, i64 %idxprom7
  %6 = load i8*, i8** %arrayidx8, align 8
  %call9 = call i32 @strcmp(i8* noundef %5, i8* noundef %6) #7
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true6
  %inc = add nsw i32 %i.0, 1
  %inc12 = add nsw i32 %j.0, 1
  br label %if.end51

if.else:                                          ; preds = %land.lhs.true6, %land.lhs.true, %while.body
  %7 = load i32, i32* %orig_count, align 4
  %8 = load i32, i32* %mod_count, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc27, %if.else
  %k.0 = phi i32 [ %i.0, %if.else ], [ %inc28, %for.inc27 ]
  %found.0 = phi i8 [ 0, %if.else ], [ %found.1, %for.inc27 ]
  %next_j.0 = phi i32 [ %8, %if.else ], [ %next_j.1, %for.inc27 ]
  %next_i.0 = phi i32 [ %7, %if.else ], [ %next_i.1, %for.inc27 ]
  %9 = load i32, i32* %orig_count, align 4
  %cmp13 = icmp slt i32 %k.0, %9
  br i1 %cmp13, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %tobool14 = trunc i8 %found.0 to i1
  %lnot = xor i1 %tobool14, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %10 = phi i1 [ false, %for.cond ], [ %lnot, %land.rhs ]
  br i1 %10, label %for.body, label %for.end29

for.body:                                         ; preds = %land.end
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc, %for.body
  %l.0 = phi i32 [ %j.0, %for.body ], [ %inc26, %for.inc ]
  %11 = load i32, i32* %mod_count, align 4
  %cmp16 = icmp slt i32 %l.0, %11
  br i1 %cmp16, label %for.body17, label %for.end

for.body17:                                       ; preds = %for.cond15
  %idxprom18 = sext i32 %k.0 to i64
  %arrayidx19 = getelementptr inbounds i8*, i8** %call1, i64 %idxprom18
  %12 = load i8*, i8** %arrayidx19, align 8
  %idxprom20 = sext i32 %l.0 to i64
  %arrayidx21 = getelementptr inbounds i8*, i8** %call2, i64 %idxprom20
  %13 = load i8*, i8** %arrayidx21, align 8
  %call22 = call i32 @strcmp(i8* noundef %12, i8* noundef %13) #7
  %cmp23 = icmp eq i32 %call22, 0
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %for.body17
  br label %for.end

if.end25:                                         ; preds = %for.body17
  br label %for.inc

for.inc:                                          ; preds = %if.end25
  %inc26 = add nsw i32 %l.0, 1
  br label %for.cond15, !llvm.loop !8

for.end:                                          ; preds = %if.then24, %for.cond15
  %found.1 = phi i8 [ 1, %if.then24 ], [ %found.0, %for.cond15 ]
  %next_j.1 = phi i32 [ %l.0, %if.then24 ], [ %next_j.0, %for.cond15 ]
  %next_i.1 = phi i32 [ %k.0, %if.then24 ], [ %next_i.0, %for.cond15 ]
  br label %for.inc27

for.inc27:                                        ; preds = %for.end
  %inc28 = add nsw i32 %k.0, 1
  br label %for.cond, !llvm.loop !9

for.end29:                                        ; preds = %land.end
  %tobool30 = trunc i8 %found.0 to i1
  br i1 %tobool30, label %if.then31, label %if.else40

if.then31:                                        ; preds = %for.end29
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc37, %if.then31
  %k32.0 = phi i32 [ %i.0, %if.then31 ], [ %inc38, %for.inc37 ]
  %cmp34 = icmp slt i32 %k32.0, %next_i.0
  br i1 %cmp34, label %for.body35, label %for.end39

for.body35:                                       ; preds = %for.cond33
  %add = add nsw i32 %k32.0, 1
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %call, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i32 noundef %add)
  br label %for.inc37

for.inc37:                                        ; preds = %for.body35
  %inc38 = add nsw i32 %k32.0, 1
  br label %for.cond33, !llvm.loop !10

for.end39:                                        ; preds = %for.cond33
  br label %if.end50

if.else40:                                        ; preds = %for.end29
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc47, %if.else40
  %k41.0 = phi i32 [ %i.0, %if.else40 ], [ %inc48, %for.inc47 ]
  %14 = load i32, i32* %orig_count, align 4
  %cmp43 = icmp slt i32 %k41.0, %14
  br i1 %cmp43, label %for.body44, label %for.end49

for.body44:                                       ; preds = %for.cond42
  %add45 = add nsw i32 %k41.0, 1
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %call, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i32 noundef %add45)
  br label %for.inc47

for.inc47:                                        ; preds = %for.body44
  %inc48 = add nsw i32 %k41.0, 1
  br label %for.cond42, !llvm.loop !11

for.end49:                                        ; preds = %for.cond42
  br label %while.end

if.end50:                                         ; preds = %for.end39
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then11
  %j.1 = phi i32 [ %inc12, %if.then11 ], [ %next_j.0, %if.end50 ]
  %i.1 = phi i32 [ %inc, %if.then11 ], [ %next_i.0, %if.end50 ]
  br label %while.cond, !llvm.loop !12

while.end:                                        ; preds = %for.end49, %lor.end
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc58, %while.end
  %k52.0 = phi i32 [ 0, %while.end ], [ %inc59, %for.inc58 ]
  %15 = load i32, i32* %orig_count, align 4
  %cmp54 = icmp slt i32 %k52.0, %15
  br i1 %cmp54, label %for.body55, label %for.end60

for.body55:                                       ; preds = %for.cond53
  %idxprom56 = sext i32 %k52.0 to i64
  %arrayidx57 = getelementptr inbounds i8*, i8** %call1, i64 %idxprom56
  %16 = load i8*, i8** %arrayidx57, align 8
  call void @free(i8* noundef %16) #11
  br label %for.inc58

for.inc58:                                        ; preds = %for.body55
  %inc59 = add nsw i32 %k52.0, 1
  br label %for.cond53, !llvm.loop !13

for.end60:                                        ; preds = %for.cond53
  %17 = bitcast i8** %call1 to i8*
  call void @free(i8* noundef %17) #11
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc67, %for.end60
  %k61.0 = phi i32 [ 0, %for.end60 ], [ %inc68, %for.inc67 ]
  %18 = load i32, i32* %mod_count, align 4
  %cmp63 = icmp slt i32 %k61.0, %18
  br i1 %cmp63, label %for.body64, label %for.end69

for.body64:                                       ; preds = %for.cond62
  %idxprom65 = sext i32 %k61.0 to i64
  %arrayidx66 = getelementptr inbounds i8*, i8** %call2, i64 %idxprom65
  %19 = load i8*, i8** %arrayidx66, align 8
  call void @free(i8* noundef %19) #11
  br label %for.inc67

for.inc67:                                        ; preds = %for.body64
  %inc68 = add nsw i32 %k61.0, 1
  br label %for.cond62, !llvm.loop !14

for.end69:                                        ; preds = %for.cond62
  %20 = bitcast i8** %call2 to i8*
  call void @free(i8* noundef %20) #11
  %call70 = call i32 @fclose(%struct._IO_FILE* noundef %call)
  ret void
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strcmp(i8* noundef, i8* noundef) #1

declare dso_local i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #3

; Function Attrs: nounwind
declare dso_local void @free(i8* noundef) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) #0 {
entry:
  %cmp = icmp ne i32 %argc, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 0
  %1 = load i8*, i8** %arrayidx, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %0, i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i64 0, i64 0), i8* noundef %1)
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 1
  %2 = load i8*, i8** %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2
  %3 = load i8*, i8** %arrayidx2, align 8
  call void @compare_files(i8* noundef %2, i8* noundef %3)
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end ]
  ret i32 %retval.0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !5}
!13 = distinct !{!13, !5}
!14 = distinct !{!14, !5}
