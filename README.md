<h1>Project Architecture</h1>

Setting Up Your Machine
-------------------------
Required installations:
-----------------------

*	Robot Framework: Robot Framework is an open-source generic automation framework. It can be used for test automation (Web, Mobile, and API) and robotic process automation (RPA).
*	Playwright: Playwright is an open-source automation library developed by Microsoft for testing web applications. It enables reliable end-to-end testing and supports multiple browsers, including Chrome, Firefox, and Safari, through a single API.
*	Allure Report: Allure Report is an open-source framework designed for test reporting, providing clear and concise visualization of test execution results. It supports various testing frameworks and languages, enhancing reports with logs, screenshots, and timelines to aid in debugging and test analysis.
*	Python 3: The programming language used in the tests.
* Node.js is an open-source, cross-platform JavaScript runtime environment that allows developers to execute JavaScript code server-side. It is built on Chrome's V8 JavaScript engine and is designed to build scalable network applications efficiently.
* Chrome, Edge or Safari: You can use everyone of these browsers for the test.

Setting Up the Test Automation Environment
------------------------------------------------------------

To perform your automation, it is necessary to install some resources, as described below:

Windows
--------

<h3>1. Installing the Python 3</h3>

*	Download from: <https://www.python.org/downloads/>.
*	Run the downloaded file and follow the instructions by clicking ‘next’.
* 	Select the 3 displayed checkboxes and continue clicking ‘next’ until ‘finish’.
*	In the prompt Console, type the command `python --version`. If the installation is correct, the installed version will appear.

<h3>2. Installing the NodeJS</h3>

*	Download from: <https://nodejs.org/en>.
*	Run the downloaded file and follow the instructions by clicking ‘next’.
*	In the prompt Console, type the command `node --version`. If the installation is correct, the installed version will appear.

<h3>3. Installing the Robot Framework</h3>

*	After installing Python, within terminal type:
  
`
sudo pip3 install robotframework==7.0.1 \
&& sudo pip3 install robotframework-browser==18.6.3 \
&& sudo pip3 install allure-robotframework==2.9.44 \
`

*	In the prompt Console, type the command `robot --version`; if the installation is correct, the installed version will appear.

* About the libs we installed, `robotframework-browser` is the Playwright library for Robot Framework, and the `allure-robotframework` is a improved report dashboard.

* If you had any problem during installation, follow this documentation: <https://robotframework.org/?tab=1#getting-started>

<h3>3. Installing the Allure Report</h3>

*	Open the Windows PowerShell and type:

`
irm get.scoop.sh | iex
`

*	In the prompt Console, type the command `allure --version`; if the installation is correct, the installed version will appear.

*	If you had any problem during installation, follow this documentation: <https://github.com/ScoopInstaller/Install#readme>

And that's it, your environment is set up.


Test Automation
--------------------

For test automation, we will use the Robot Framework.

<h3>Learning to Use the Resources Folder</h3>

*	The resources folder contains the methods used and paths followed based on each keyword utilized.
*	The main.robot file is where most configurations are kept.
*	Codes and workflows are allocated according to the screen that the flow is using (if it is a Order and Returns screen, the keywords will go inside the order_and_returns_keywords.robot)
*   The Gherkin-written test cases will be located within the tests folder, according to the screen that the flow is using (if it is a Order and Returns screen, the keywords will go inside the order_and_returns.robot)

<h3>Using Tags</h3>

We use tags to differentiate scenarios by groups, functionalities, or testing phases. Tags are inserted on the line below the keyword name.
In the terminal, when we want to run scenarios that are named with tags, we simply use the following command:

`
robot -d -i tag
`

This command will run all scenarios that have the tag.

Executing Automated Tests
-----------------------------------

To execute the automated tests, we will use some commands from the root folder of our project.

*	To execute all implemented scenarios, we use the following code:
  
`
robot ./tests/
`

* To execute the automation, by default, the code is configured to run the automation on Google Chrome. If you need to change the browser being used, use the following commands:

For Firefox: `robot -v browser:firefox ./tests/`
For Safari: `robot -v browser:webkit ./tests/`

*	To execute all scenarios and generate a report with screenshots, we use the following code:
  
`
robot -d ./logs ./tests/
`
*   In the ./logs folder of the project, an HTML file with the test scenarios report is generated.

*	To execute all scenarios and generate a report with Allure Report, we use the following code:
  
`
robot --listener 'allure_robotframework;./allure-results/' ./tests
`
*   After the execution, with Windows PowerShell, you can go to the project folder and execute:
  
`
allure serve
`

Just open it in your browser to view the results.
