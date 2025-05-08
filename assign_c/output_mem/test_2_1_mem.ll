; ModuleID = '<stdin>'
source_filename = "./assign_c/test_2_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@__const.foo.temp = private unnamed_addr constant [20 x i8] c"Hello\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str = private unnamed_addr constant [5 x i8] c"init\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Buffer before input: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"copied[%d] = %c\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Length so far: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"Enter some text: \00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"You entered: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo() #0 {
entry:
  %buffer = alloca [10 x i8], align 1
  %temp = alloca [20 x i8], align 16
  %copied = alloca [10 x i8], align 1
  %0 = bitcast [20 x i8]* %temp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([20 x i8], [20 x i8]* @__const.foo.temp, i32 0, i32 0), i64 20, i1 false)
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0
  %call = call i8* @strcpy(i8* noundef %arraydecay, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #5
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 4
  store i8 95, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 5
  store i8 120, i8* %arrayidx1, align 1
  %arrayidx2 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 6
  store i8 0, i8* %arrayidx2, align 1
  %arraydecay3 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0
  %call4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i8* noundef %arraydecay3)
  %arraydecay5 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 0
  %arraydecay6 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0
  %call7 = call i8* @strncpy(i8* noundef %arraydecay5, i8* noundef %arraydecay6, i64 noundef 10) #5
  %arrayidx8 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 9
  store i8 0, i8* %arrayidx8, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc15, %for.inc ]
  %length.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %idxprom = sext i32 %i.0 to i64
  %arrayidx9 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 %idxprom
  %1 = load i8, i8* %arrayidx9, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom11 = sext i32 %i.0 to i64
  %arrayidx12 = getelementptr inbounds [10 x i8], [10 x i8]* %copied, i64 0, i64 %idxprom11
  %2 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %2 to i32
  %call14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i32 noundef %i.0, i32 noundef %conv13)
  %inc = add nsw i32 %length.0, 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc15 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  %call16 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 noundef %length.0)
  %call17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0))
  %arraydecay18 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %call19 = call i8* @fgets(i8* noundef %arraydecay18, i32 noundef 10, %struct._IO_FILE* noundef %3)
  %tobool = icmp ne i8* %call19, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %arraydecay20 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0
  %call21 = call i64 @strcspn(i8* noundef %arraydecay20, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)) #6
  %arrayidx22 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 %call21
  store i8 0, i8* %arrayidx22, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %arraydecay23 = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0
  %call24 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* noundef %arraydecay23)
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8* noundef, i8* noundef) #2

declare dso_local i32 @printf(i8* noundef, ...) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8* noundef, i8* noundef, i64 noundef) #2

declare dso_local i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strcspn(i8* noundef, i8* noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  call void @foo()
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
