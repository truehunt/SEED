var IBTABLANG = {
  "kr" : {
    "tab" : {
      "closeThisTab" : "탭 닫기",
      "closeAllTabs" : "모든 탭 닫기",
      "closeRightTabs" : "현재 탭 오른쪽 모두 닫기",
      "closeLeftTabs" : "현재 탭 왼쪽 모두 닫기",
      "closeAllTabsExceptThis" : "현재 탭 제외하고 닫기",
      "disableThisTab" : "탭 비활성화",
      "disableAllTabs" : "모든 탭 비활성화",
      "enableTab" : "탭 활성화",
      "enableAllTabs" : "모든 탭 활성화",
      "hideThisTab" : "탭 숨기기",
      "hideAllTabs" : "모든 탭 숨기기",
      "showAllTabs" : "모든 탭 보이기",
      "holdThisTab" : "탭 고정",
      "holdAllTabs" : "모든 탭 고정",
      "releaseThisTab" : "탭 고정해제",
      "releaseAllTabs" : "모든 탭 고정해제"
    },
    "alert" : {
      "variableWrong" : "${0} 값은 잘못된 값입니다.",
      "variableRequired" : "${0} 값은 필수 입니다.",
      "variableInteger" : "${0} 값은 정수여야 합니다.",
      "variableFloat" : "${0} 값은 실수여야 합니다.",
      "variableString" : "${0} 값은 문자열이어야 합니다.",
      "variableLessThen" : "${0}값은 ${1}값보다 작아야합니다.",
      "variableGreaterThen" : "${0}값은 ${1}값보다 커야합니다.",
      "variableEpual" : "${0}값은 ${1}값과 같아야합니다.",
      "holdTab" : "탭이 고정되어있습니다!",
      "currentTab" : "현재 탭입니다.",
      "isntTab" : "이동할 수 없습니다.",
      "noTab" : "없는 탭입니다.",
      "moveTab" : "${0}번째 탭으로 이동했습니다.",
      "goLink" : "'${0}'에 '${1}'으로 이동합니다.",
      "noMessage" : "알림 메시지를 입력해주세요!",
      "notSupport" : "현재 환경은 지원하지 않습니다! \n 지원 가능한 브라우저를 확인해주세요.",
      "eventListenerType": "이벤트 종류를 확인해주세요.",
      "eventListenerFunc": "이벤트 함수를 확인해주세요."
    },
    "text" : {
      "productName" : "[IBTab]",
      "referenceSite" : "\n참고 사이트 : http://www.ibsheet.com/ibtab.html"
    }
  }
};

function createIBTab(tabs, contents, id, opt) {
    var obj = {};

    if(typeof opt !== "undefined" && typeof opt === "object") {
        obj = opt;
    }

    obj["tabs"] = tabs;
    obj["contents"] = contents;
    obj["id"] = id;

    window[obj["id"]] = IBTab(obj);
    window[obj["id"]].init(obj);
}
