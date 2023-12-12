document.addEventListener("DOMContentLoaded", function () {
  let btn = document.querySelector("#show");
  let Q1 = document.querySelector("#Q1");
  let overlay = document.querySelector(".overlay");
  let closeModal = document.querySelector("#closeModal");
  
  btn.addEventListener("click", function () {
    overlay.style.display = "flex";
  });

  Q1.addEventListener("click", function () {
    overlay.style.display = "flex";
  });

  closeModal.addEventListener("click", function () {
    overlay.style.display = "none";
  });

});



let currentQuestion = 1;

function checkAnswer(selectedOption) {
    // 在這裡添加檢查答案的邏輯
    const correctAnswer = 'B'; // 假設正確答案是 'B'
    const isCorrect = selectedOption === correctAnswer;

    // 根據答案是否正確，改變按鈕顏色
    const answerButtons = document.querySelectorAll('.question button');
    answerButtons.forEach(button => {
        if (button.innerText === correctAnswer) {
            button.style.backgroundColor = isCorrect ? 'green' : 'blue';
        } else {
            button.style.backgroundColor = 'blue';
        }
        button.disabled = true; // 使按鈕無法再次點擊
    });

    // 匯到下一個問題
    setTimeout(() => {
        currentQuestion++;
        resetQuestion(); // 重置按鈕顏色和啟用按鈕
        showNextQuestion();
    }, 1000);
}

function resetQuestion() {
    const answerButtons = document.querySelectorAll('.question button');
    answerButtons.forEach(button => {
        button.style.backgroundColor = ''; // 重置按鈕顏色
        button.disabled = false; // 啟用按鈕
    });
}

function showNextQuestion() {
  // 這是一個示例，你需要根據你的實際需求更新問題內容
  const questionText = document.querySelector('#overlayQuestion .modal p');
  questionText.innerText = currentQuestion + '. 下一個問題是什麼？';

  // 這是一個示例，你需要根據你的實際需求更新表單 id
  const nextQuestionForm = document.querySelector('#overlayQuestion .modal .question');
  nextQuestionForm.id = 'Q' + currentQuestion + 'Form';

  // 這是一個示例，你需要根據你的實際需求更新 input id
  const nextQuestionInput = document.querySelector('#overlayQuestion .modal .question input');
  nextQuestionInput.id = 'Q' + currentQuestion + '_';
}