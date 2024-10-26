#!/bin/bash

# 환경 변수 설정
export WORK="/root/Popp-BOT"

# 색상 정의
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # 색상 초기화

echo -e "${GREEN}POPP 봇을 설치합니다.${NC}"
echo -e "${GREEN}스크립트작성자: https://t.me/kjkresearch${NC}"
echo -e "${GREEN}출처: https://github.com/Galkurta/Popp-BOT${NC}"

echo -e "${CYAN}이 봇은 다음과 같은 기능을 갖고 있습니다.${NC}"
echo -e "${CYAN}웜캐칭 / 에그업그레이드/ 에그크래킹 / 각종 태스크${NC}"

echo -e "${GREEN}설치 옵션을 선택하세요:${NC}"
echo -e "${YELLOW}1. Bird 봇 새로 설치${NC}"
echo -e "${YELLOW}2. 재실행하기${NC}"
read -p "선택: " choice

case $choice in
  1)
    echo -e "${GREEN}POPP 봇을 새로 설치합니다.${NC}"

    # 사전 필수 패키지 설치
    echo -e "${YELLOW}시스템 업데이트 및 필수 패키지 설치 중...${NC}"
    sudo apt update
    sudo apt install -y git

    echo -e "${YELLOW}작업 공간 준비 중...${NC}"
    if [ -d "$WORK" ]; then
        echo -e "${YELLOW}기존 작업 공간 삭제 중...${NC}"
        rm -rf "$WORK"
    fi

    # GitHub에서 코드 복사
    echo -e "${YELLOW}GitHub에서 코드 복사 중...${NC}"
    git clone https://github.com/Galkurta/Popp-BOT.git
    cd "$WORK"

    # 파이썬 및 필요한 패키지 설치
    echo -e "${YELLOW}시스템 업데이트 및 필수 패키지 설치 중...${NC}"
    sudo apt update
    sudo apt install -y python3 python3-pip
    pip install -r requirements.txt

    echo -e "${YELLOW}Web텔레그렘에 접속후 F12를 누르시고 게임을 실행하세요${NC}"
    read -p "애플리케이션-세션저장소-Birds와 관련된 URL클릭 후 나오는 UserID나 QueryID를 적어두세요 (엔터) : "
    echo -e "${GREEN}다계정의 query_id를 입력할 경우 줄바꿈으로 구분하세요.${NC}"
    echo -e "${GREEN}입력을 마치려면 엔터를 두 번 누르세요.${NC}"
    echo -e "${YELLOW}Userid를 입력하세요(user= 또는 query_id= 포함해서 입력):${NC}"
    
    # 쿼리 파일 생성 및 초기화
    {
        while IFS= read -r line; do
            [[ -z "$line" ]] && break
            echo "$line"
        done
    } > "$WORK/data.txt"

    # 봇 구동
    python3 main.py
    ;;
    
  2)
    echo -e "${GREEN}Bird 봇을 재실행합니다.${NC}"
    cd "$WORK"
    pip install -r requirements.txt
    python3 main.py
    ;;

  *)
    echo -e "${RED}잘못된 선택입니다. 다시 시도하세요.${NC}"
    ;;
esac
