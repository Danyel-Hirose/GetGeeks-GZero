robot -l NONE -o NONE -r NONE tasks/Delorean.robot
pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:False  tests


# Dando um jeito na Evidencia:
rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot/


#pabot -d ./logs -v BROWSER:chromium -v HEADLESS:False  tests
#pabot -d ./logs -v BROWSER:chromium -v HEADLESS:True -i smoke tests
#robot -d ./logs tests
#robot -d ./logs tests/Attempt_BeGeek.robot
#robot -d ./logs tests/BeGeek_fields.robot
#robot -d ./logs tests/BeGeek.robot
#robot -d ./logs tests/Login.robot
#robot -d ./logs tests/Signup.robot
#robot -d ./logs -i DDD tests/BeGeek.robot 
