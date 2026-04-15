#!/bin/bash
# 🎮 게임 진행상황 자동 업데이트 스크립트 (Git Bash/Linux용)
# 사용법: ./update-progress.sh "게임이름" "작업내용"

GAME_NAME="${1:-my-game}"
WORK_DONE="${2:-진행상황 업데이트}"
DATE=$(date "+%Y-%m-%d %H:%M")

echo ""
echo "====================================="
echo "  🎮 Claude Code Game Studios"
echo "  진행상황 업데이트 시작..."
echo "====================================="
echo ""

echo "📋 현재 변경 사항:"
git status --short
echo ""

# 변경 사항 확인
if [ -z "$(git status --short)" ]; then
    echo "⚠️  변경된 파일이 없습니다."
    echo "   게임 파일을 수정한 후 다시 실행하세요."
    exit 0
fi

echo "📦 변경사항 스테이징..."
git add .

COMMIT_MSG="🎮 [$GAME_NAME] $WORK_DONE - $DATE"
echo "💾 커밋: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo ""
echo "🚀 GitHub에 업로드 중..."
git push origin main

echo ""
echo "====================================="
echo "  ✅ 업데이트 완료!"
echo "  게임: $GAME_NAME"
echo "  작업: $WORK_DONE"
echo "  시간: $DATE"
echo "====================================="
echo ""
