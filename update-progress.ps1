# 🎮 게임 진행상황 자동 업데이트 스크립트
# 사용법: .\update-progress.ps1 "게임이름" "작업내용"
# 예시:  .\update-progress.ps1 "MyPlatformer" "플레이어 점프 구현 완료"

param(
    [Parameter(Mandatory=$false)]
    [string]$GameName = "my-game",
    
    [Parameter(Mandatory=$false)]
    [string]$WorkDone = "진행상황 업데이트"
)

$Date = Get-Date -Format "yyyy-MM-dd HH:mm"
$Emoji = "🎮"

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  $Emoji Claude Code Game Studios" -ForegroundColor Yellow
Write-Host "  진행상황 업데이트 시작..." -ForegroundColor White
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Git 상태 확인
Write-Host "📋 현재 변경 사항:" -ForegroundColor Green
git status --short

Write-Host ""

# 변경 사항이 있는지 확인
$changes = git status --short
if (-not $changes) {
    Write-Host "⚠️  변경된 파일이 없습니다." -ForegroundColor Yellow
    Write-Host "   게임 파일을 수정한 후 다시 실행하세요." -ForegroundColor Gray
    exit 0
}

# 모든 변경사항 스테이징
Write-Host "📦 변경사항 스테이징..." -ForegroundColor Green
git add .

# 커밋 메시지 생성
$CommitMsg = "$Emoji [$GameName] $WorkDone - $Date"
Write-Host ""
Write-Host "💾 커밋: $CommitMsg" -ForegroundColor Green
git commit -m $CommitMsg

# 원격 저장소에 푸시
Write-Host ""
Write-Host "🚀 GitHub에 업로드 중..." -ForegroundColor Green
git push origin main

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  ✅ 업데이트 완료!" -ForegroundColor Green
Write-Host "  게임: $GameName" -ForegroundColor White
Write-Host "  작업: $WorkDone" -ForegroundColor White
Write-Host "  시간: $Date" -ForegroundColor Gray
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
