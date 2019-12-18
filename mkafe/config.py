# file untuk konfig aplikasi
import os

class Configuration(object):
	DEBUG = 'True'
	MYSQL_USER = 'root'
	MYSQL_PASSWORD = ''
	MYSQL_DB = 'mkafe'
	MYSQL_HOST = 'localhost'
	SECRET_KEY = '1234567890987654321'
	UPLOAD_FOLDER = os.path.realpath('.')+'/static/images'
	PDF_FOLDER = os.path.realpath('.')+'/static/pdf'
	TEMPLATE_FOLDER = os.path.realpath('.')+'/templates'
