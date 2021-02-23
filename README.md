# Расчет наращения и дисконтирования по простым и сложным %

<h3>Программа позволяет производить расчеты по следующим типам задач:</h3>
<ul>
  <li>пн — наращение по простым % ставкам.</li>
  <li>сно — наращение по сложным % ставкам, общий метод.</li>
  <li>снс — наращение по сложным % ставкам, смешанный метод.</li>
  <li>снн - наращение по сложным % ставкам m раз в год</li>
  <li>пдм — дисконтирование по сложным % ставкам, математическое дисконтирование.</li>
  <li>пдб — дисконтирование по сложным % ставкам, банковский учет векселей.</li>
  <li>сдм — дисконтирование по сложным % ставкам, математическое дисконтирование.</li>
  <li>сдб - дисконтирование по сложным % ставкам, банковский учет векселей.</li>
</ul>
<h3>Работа с программой происходит по следующему механизму:</h3>
<ol>
  <li>Сначала пользователь вводит тип задачи, которую нужно решить (в качестве ответа программа воспринимает установленные сокращения).</li>
  <li>В зависимости от выбора пользователь вводит соответствующие значения, где:</li>
</ol>
<ul>
  <li>P - первоначальная сумма ссуды</li>
  <li>S - конечная сумма ссуды</li>
  <li>n - срок ссуды в годах (может быть дробным)</li>
  <li>i - процентная ставка, пишется в формате числа процентов, НЕ В ВИДЕ ДЕСЯТИЧНОЙ ДРОБИ! (если i=10%, то вводится 10, а не 0.1)</li>
  <li>d - учетная ставка, формат аналогичен i</li>
  <li>a - часть срока ссуды в годах при смешанном методе расчета, b - срок ссуды в днях при смешанном методе расчета</li>
   <li>t - срок ссуды в днях при расчете n с выбранной временной базой K</li>
 </ul>
 <h3>После завершения ввода программа выводит результат вычислений в консоль. помимо этого программа выводит ход расчетов и его результат в файл output.txt. Найти его можно в той же директории, что и саму программу.</h3>

<div>Для использования программы в зависимости от вашей операционной системы можно загрузить к себе на устройство нужный файл (с расширением .exe или исполняемый файл linux), либо скачать исходный код программы для соответствующей системы и скомпилировать ее, например, этим: <a href="https://www.freepascal.org/">Free Pascal</a>.
Файлы формата .pas содержат в себе исходные коды программы, можете менять и дополнять их по своему усмотрению.</div>
<h3>Чтобы Linux-версия заработала, необходимо разрешить выполнять его как программу!</h3>

<h3>Что нужно добавить сюда?</h3>
<ol>
  <li>ОБРАБОТКУ ИСКЛЮЧЕНИЙ!!1.</li>
</ol>
