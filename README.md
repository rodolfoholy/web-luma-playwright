<h1>Project Architecture</h1>

Setting Up Your Machine
-------------------------
Required installations:
-----------------------

*	Robot Framework: Robot Framework is an open-source generic automation framework. It can be used for test automation (Web, Mobile, and API) and robotic process automation (RPA).
*	Python 3: The programming language used in the tests.
*   Node.js is an open-source, cross-platform JavaScript runtime environment that allows developers to execute JavaScript code server-side. It is built on Chrome's V8 JavaScript engine and is designed to build scalable network applications efficiently.

Setting Up the Test Automation Environment
------------------------------------------------------------

To perform your automation, it is necessary to install some resources, as described below:

Windows
--------

<h3>1. Installing the Python 3</h3>

*	Download from: <https://www.python.org/downloads/>.
*	Run the downloaded file and follow the instructions by clicking ‘next’.
* 	Select the 3 displayed checkboxes and continue clicking ‘next’ until ‘finish’.
*	In the prompt Console, type the command `python --version`; if the installation is correct, the installed version will appear.

<h3>2. Installing the NodeJS</h3>

*	Download from: <https://nodejs.org/en>.
*	Run the downloaded file and follow the instructions by clicking ‘next’.
*	In the prompt Console, type the command `node --version`; if the installation is correct, the installed version will appear.

<h3>3. Installing the Robot Framework</h3>

*	After installing Python, within terminal type:
  
`bash
sudo pip3 install robotframework==7.0.1 \
&& sudo pip3 install robotframework-browser==18.6.3 \
&& sudo pip3 install allure-robotframework==2.9.44 \
`

*	In the prompt Console, type the command `robot --version`; if the installation is correct, the installed version will appear.
*   About the libs we installed, `robotframework-browser` is the Playwright library for Robot Framework, and the `allure-robotframework` is a improved report dashboard.
If you had any problem during installation, follow this documentation: <https://robotframework.org/?tab=1#getting-started>

<h3>3. Installing the Allure Report</h3>

*	Open the Windows PowerShell and type:

`bash
irm get.scoop.sh | iex
`

*	In the prompt Console, type the command `allure --version`; if the installation is correct, the installed version will appear.
If you had any problem during installation, follow this documentation: <https://github.com/ScoopInstaller/Install#readme>

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

`bash
robot -d -i tag
`

This command will run all scenarios that have the tag.

Executing Automated Tests
-----------------------------------

To execute the automated tests, we will use some commands from the root folder of our project.

*	To execute all implemented scenarios, we use the following code:
  
`bash
robot ./tests/
`

*	To execute all scenarios and generate a report with screenshots, we use the following code:
  
`bash
robot -d ./logs ./tests/
`
*   In the ./logs folder of the project, an HTML file with the test scenarios report is generated.

*	To execute all scenarios and generate a report with Allure Report, we use the following code:
  
`bash
robot --listener 'allure_robotframework;./allure-results/' ./tests
`
*   After the execution, with Windows PowerShell, you can go to the project folder and execute:
  
`bash
allure serve
`

Just open it in your browser to view the results.
