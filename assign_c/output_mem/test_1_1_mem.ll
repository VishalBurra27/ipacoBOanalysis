; ModuleID = '<stdin>'
source_filename = "./assign_c/test_1_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"Buffer content: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @boo(i8* noundef %input) #0 {
entry:
  %buffer = alloca [64 x i8], align 16
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %buffer, i64 0, i64 0
  %call = call i8* @strncpy(i8* noundef %arraydecay, i8* noundef %input, i64 noundef 63) #4
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* %buffer, i64 0, i64 63
  store i8 0, i8* %arrayidx, align 1
  %arraydecay1 = getelementptr inbounds [64 x i8], [64 x i8]* %buffer, i64 0, i64 0
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay1)
  ret void
}

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8* noundef, i8* noundef, i64 noundef) #1

declare dso_local i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %large_input = alloca [128 x i8], align 16
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %large_input, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 127, i1 false)
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* %large_input, i64 0, i64 127
  store i8 0, i8* %arrayidx, align 1
  %arraydecay1 = getelementptr inbounds [128 x i8], [128 x i8]* %large_input, i64 0, i64 0
  call void @boo(i8* noundef %arraydecay1)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
