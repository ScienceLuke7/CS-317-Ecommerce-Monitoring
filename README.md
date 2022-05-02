# CS-317-Ecommerce-Monitoring

PYTHON VERSION FOR THIS PROJECT MUST BE GREATER THAN 3.0.0

IMPORTANT: To execute this application install all the packages listed in `requirements.txt`

To install all the packages use either `pip` or `anaconda`. Anaconda is more difficult to set up, but it is preference. All required packages are in the `requirements.txt` file


Setting up the Database:
    1. No setup required

Setting up and Hosting the REST API:
    1. Make sure the Flask package is installed
    2. Execute the `E_Commerce_Controller.py` file using the command `python <PATH_INTO_E-Commerce.API>/E_Commerce_Controller.py`
    3. The API should be hosted on http://127.0.0.1:5000

Setting up and Executing the UI:
    1. Verify that `pyqt` and `httpx` packages are installed
    2. Execute the `E_Commerce_UI.py` file by using the command `python <PATH_INTO_E-Commerce.UI>/E_Commerce_UI.py`
    3. A simple GUI will appear

Setting up and Executing the Monitoring API:
    1. No additional packages are required
    2. Exectute the `ProductMonitor.py` file by using the command `python <PATH_INTO_E-Commerce.API>/ProductMonitor.py`
    3. Text should be printing to the console to indicate database retrieval every 10 seconds.