# file aplikasi
from flask import Flask, render_template, request, redirect, url_for, session
# from flask_uploads import UploadSet, configure_uploads, IMAGES
from werkzeug import secure_filename
import mysql.connector
import os
import pdfkit
from datetime import datetime
import locale
# import konfigurasi
from config import Configuration

application = Flask(__name__)
application.config.from_object(Configuration)

def openDb():
	global conn, cursor
	conn = mysql.connector.connect(
		host='localhost',
		user='root',
		password='',
		database='mkafe')
	cursor = conn.cursor()

def closeDb():
	global conn, cursor
	cursor.close()
	conn.close()

def rupiah_format(angka, with_prefix=False, desimal=2):
    locale.setlocale(locale.LC_NUMERIC, 'IND')
    rupiah = locale.format("%.*f", (desimal, angka), True)
    if with_prefix:
        return "Rp. {}".format(rupiah)
    return rupiah
	
# halaman utama
@application.route('/')
def index():
	if 'loggedin' in session:
		if session['login_as'] == 'admin':
			username = session['username']
			return render_template('admin.html', username=username)
		elif session['login_as'] == 'kasir':
			username = session['username']
			openDb()
			cursor.execute("SELECT id_kasir,nm_kasir FROM kasir WHERE username='%s'" % (username))
			data = cursor.fetchone()
			session['idkasir'] = data[0]
			session['nmkasir'] = data[1]
			closeDb()
			return render_template('kasir.html', username=username)
		elif session['login_as'] == 'member':
			username = session['username']
			openDb()
			cursor.execute("SELECT id_member,nm_member,no_telp FROM member WHERE username='%s'" % (username))
			data = cursor.fetchone()
			session['idmember'] = data[0]
			session['nmmember'] = data[1]
			session['notelpon'] = data[2]
			closeDb()
			return render_template('member.html', username=username)
	else:
		session['loggedin']=False
		session['login_as']=False
	return render_template('index.html')

# halaman & proses login
@application.route('/login', methods=['GET', 'POST'])
def login():
	msg = ''
	if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
		username = request.form['username']
		password = request.form['password']
		openDb()
		cursor.execute('''SELECT * FROM login WHERE username = '%s' AND password = password('%s')''' % (username, password))
		account = cursor.fetchone()
		closeDb()
		if account:
			session['loggedin'] = True
			session['username'] = account[0]
			session['login_as'] = account[2]
			return redirect(url_for('index'))
		else:
			msg = 'Username / Password Salah.'
	return render_template('login.html', msg=msg)

# halaman dan proses data member
@application.route('/data_member', methods=['GET', 'POST'])
def data_member():
	if 'loggedin' in session:
		msg = 'Halaman daftar member'
		openDb()
		cursor.execute("SELECT * FROM member")
		container = cursor.fetchall()
		closeDb()
		return render_template('data_member.html', container=container, msg=msg)		
	else:
		return redirect(url_for('login'))

@application.route('/daftar_member', methods=['GET', 'POST'])
def daftar_member():
	msg = ''
	if request.method == 'POST' and 'nama' in request.form and 'alamat' in request.form and 'telepon' in request.form and 'email' in request.form and 'username' in request.form and 'password' in request.form:
		nikd = request.form['nama']
		alam = request.form['alamat']
		tele = request.form['telepon']
		emai = request.form['email']
		user = request.form['username']
		pask = request.form['password']
		data = (nikd, alam, tele, emai, user, pask)	
		openDb()
		cursor.execute("SELECT * FROM login WHERE username = '%s'" % (user))
		account = cursor.fetchone()
		if account:
			msg = 'Username sudah terdaftar'
		elif not nikd or not alam or not tele or not emai or not user or not pask:
			msg = 'Silahkan lengkapi data daftar'
		else:
			cursor.execute("INSERT INTO login values ('%s',password('%s'),'member')" % (user,pask))
			conn.commit()
			cursor.execute("INSERT INTO member (nm_member,alamat,no_telp,email,username,password) VALUES ('%s','%s','%s','%s','%s','%s')" % (data))
			conn.commit()
			closeDb()
			msg = 'Data berhasil didaftarkan.'
	elif request.method == 'POST':
		msg = 'Silahkan lengkapi data member.'
	return render_template('daftar_member.html', msg=msg) 

@application.route('/ubah_member/<id>', methods=['GET', 'POST'])
def ubah_member(id):
	if 'loggedin' in session:
		msg = ''
		openDb()
		cursor.execute("SELECT * FROM member WHERE id_member='%s'" % (id))
		kirim = cursor.fetchone()
		closeDb()
		if request.method == 'POST':
			idku = request.form['iniid']
			nikd = request.form['nama']
			alam = request.form['alamat']
			tele = request.form['telepon']
			emai = request.form['email']
			user = request.form['username']
			pask = request.form['password']
			unlm = request.form['userlama']
			pwlm = request.form['passlama']
			data = (nikd, alam, tele, emai, user, pask, idku)
			openDb()
			cursor.execute("SELECT * FROM login WHERE username = '%s'" % (user))
			account = cursor.fetchone()
			closeDb()
			if user!=unlm and account:
				msg = 'Username telah dipakai'
			else:
				openDb()
				cursor.execute("UPDATE login SET username='%s', password=password('%s') WHERE username='%s' and password=password('%s')" % (user,pask,unlm,pwlm))
				conn.commit()
				cursor.execute("UPDATE member SET nm_member='%s', alamat='%s', no_telp='%s', email='%s', username='%s', password='%s' WHERE id_member='%s'" % data)
				conn.commit()
				closeDb()
				msg = 'Data Member telah dirubah.'
				return redirect(url_for('data_member', msg=msg))
		return render_template('ubah_member.html', baris=kirim, msg=msg)
	else:
		return redirect(url_for('login'))
		
@application.route('/hapus_member/<id>', methods=['GET', 'POST'])
def hapus_member(id):
	if 'loggedin' in session:
		try:
			openDb()
			cursor.execute("SELECT username, password FROM member WHERE id_member='%s'" % id)
			data = cursor.fetchone()
			cursor.execute("DELETE FROM member WHERE id_member='%s'" % id)
			cursor.execute("DELETE FROM login WHERE username='%s' and password=password('%s')" % (data[0],data[1]))
			conn.commit()
			closeDb()
			return redirect(url_for('data_member'))
		except:
			return redirect(url_for('data_member'))
	else:
		return redirect(url_for('login'))
		
# halaman dan proses data kasir
@application.route('/data_kasir', methods=['GET', 'POST'])
def data_kasir():
	if 'loggedin' in session:
		openDb()
		cursor.execute("SELECT * FROM kasir")
		container = cursor.fetchall()
		closeDb()
		return render_template('data_kasir.html', container=container)	
	else:
		return redirect(url_for('login'))

@application.route('/tambah_kasir', methods=['GET', 'POST'])
def tambah_kasir():
	if 'loggedin' in session:
		msg = ''
		if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
			nikd = request.form['nama']
			alam = request.form['alamat']
			tlhr = request.form['tgllahir']
			klhr = request.form['kotalahir']
			tele = request.form['telepon']
			emai = request.form['email']
			user = request.form['username']
			pask = request.form['password']
			data = (nikd, alam, tlhr, klhr, tele, emai, user, pask)	
			openDb()
			cursor.execute("SELECT * FROM login WHERE username = '%s'" % (user))
			account = cursor.fetchone()
			if account:
				msg = 'Username sudah terdaftar'
			else:
				cursor.execute("INSERT INTO login values ('%s',password('%s'),'kasir')" % (user,pask))
				conn.commit()
				cursor.execute("INSERT INTO kasir (nm_kasir, alamat, tgl_lhr, kota_lhr, no_telp, email, username, password) values ('%s','%s','%s','%s','%s','%s','%s','%s')" % data)	
				conn.commit()
				closeDb()
				msg = 'Data berhasil ditambahkan.'
				return redirect(url_for('data_kasir', msg=msg))
		elif request.method == 'POST':
			msg = 'Silahkan lengkapi data kasir.'
		return render_template('tambah_kasir.html', msg=msg)
	else:
		return redirect(url_for('login'))

@application.route('/ubah_kasir/<id>', methods=['GET', 'POST'])
def ubah_kasir(id):
	if 'loggedin' in session:
		msg = ''
		openDb()
		cursor.execute("SELECT * FROM kasir WHERE id_kasir='%s'" % (id))
		kirim = cursor.fetchone()
		closeDb()
		if request.method == 'POST':
			idku = request.form['iniid']
			nikd = request.form['nama']
			alam = request.form['alamat']
			tlhr = request.form['tgllahir']
			klhr = request.form['kotalahir']
			tele = request.form['telepon']
			emai = request.form['email']
			user = request.form['username']
			pask = request.form['password']
			unlm = request.form['userlama']
			pwlm = request.form['passlama']
			data = (nikd, alam, tlhr, klhr, tele, emai, user, pask, idku)
			openDb()
			cursor.execute("SELECT * FROM login WHERE username = '%s'" % (user))
			account = cursor.fetchone()
			closeDb()
			if user!=unlm and account:
				msg = 'Ganti username'
			else:
				openDb()
				cursor.execute("UPDATE login SET username='%s', password=password('%s') WHERE username='%s' and password=password('%s')" % (user,pask,unlm,pwlm))
				conn.commit()
				cursor.execute("UPDATE kasir SET nm_kasir='%s', alamat='%s', tgl_lhr='%s', kota_lhr='%s', no_telp='%s', email='%s', username='%s', password='%s' WHERE id_kasir='%s'" % data)
				conn.commit()
				closeDb()
				msg = 'Data Kasir telah dirubah.'
				return redirect(url_for('data_kasir', msg=msg))
		return render_template('ubah_kasir.html', baris=kirim, msg=msg)
	else:
		return redirect(url_for('login'))
		
@application.route('/hapus_kasir/<id>', methods=['GET', 'POST'])
def hapus_kasir(id):
	if 'loggedin' in session:
		try:
			openDb()
			cursor.execute("SELECT username, password FROM kasir WHERE id_kasir='%s'" % id)
			data = cursor.fetchone()
			cursor.execute("DELETE FROM kasir WHERE id_kasir='%s'" % id)
			cursor.execute("DELETE FROM login WHERE username='%s' and password=password('%s')" % (data[0],data[1]))
			conn.commit()
			closeDb()
			return redirect(url_for('data_kasir'))
		except:
			return redirect(url_for('data_kasir'))
	else:
		return redirect(url_for('login'))
		
# halaman dan proses data menu
@application.route('/data_menu', methods=['GET', 'POST'])
def data_menu():
	kate = 'semua'
	if 'loggedin' in session:
		openDb()
		cursor.execute("SELECT DISTINCT kategori FROM menu ORDER BY kategori")
		kolom = cursor.fetchall()
		closeDb()
		openDb()
		cursor.execute("SELECT * FROM menu")
		container = cursor.fetchall()
		closeDb()
		if request.method == 'POST' and 'kate' in request.form:
			kategori = request.form['kate']
			if kategori == 'semua':
				return redirect(url_for('data_menu'))
			else:
				openDb()
				cursor.execute("SELECT * FROM menu WHERE kategori='%s'" % (kategori))
				container = cursor.fetchall()
				closeDb()
				kate = kategori
		return render_template('data_menu.html', container=container, kolom=kolom, kate=kate)
	else:
		return redirect(url_for('login'))

@application.route('/menu_baru', methods=['GET', 'POST'])
def menu_baru():
	if 'loggedin' in session:
		openDb()
		cursor.execute("SELECT DISTINCT kategori FROM menu ORDER BY kategori")
		container = cursor.fetchall()
		closeDb()
		if request.method == 'POST':
			nama = request.form['nama']
			desk = request.form['deskripsi']
			kate = request.form['kategori']
			harg = request.form['harga']
			foto = request.files['foto']
			disk = request.form['diskon']
			ppnn = request.form['ppn']
			nmft = secure_filename(foto.filename)
			data = (nama,kate,nmft,harg,desk,disk,ppnn)		
			filename = application.config['UPLOAD_FOLDER']+'/'+nmft
			if 'foto' in request.files:
				openDb()
				cursor.execute("INSERT INTO menu (nm_menu,kategori,ft_menu,harga,deskripsi,diskon,ppn) VALUES ('%s','%s','%s','%s','%s','%s','%s')" % data)
				conn.commit()
				closeDb()
				foto.save(filename)
				return redirect(url_for('data_menu'))
			else:
				msg = 'file upload foto bermasalah'
				return render_template('menu_baru.html', msg=msg, container=container)
		return render_template('menu_baru.html', container=container)
	else:
		return redirect(url_for('login'))

@application.route('/ubah_menu/<id>', methods=['GET', 'POST'])
def ubah_menu(id):
	if 'loggedin' in session:
		openDb()
		cursor.execute("SELECT * FROM menu WHERE id_menu='%s'" % id)
		baris = cursor.fetchone()
		cursor.execute("SELECT DISTINCT kategori FROM menu ORDER BY kategori")
		container = cursor.fetchall()
		closeDb()
		if request.method == 'POST':
			idku = request.form['idmenu']
			nama = request.form['nama']
			desk = request.form['deskripsi']
			kate = request.form['kategori']
			harg = request.form['harga']
			disk = request.form['diskon']
			ppnn = request.form['ppn']
			foto = request.files['fotobaru']
			data1 = (nama,kate,harg,desk,disk,ppnn,idku)
			if foto:
				nmft = secure_filename(foto.filename)
				data = (nama,kate,nmft,harg,desk,disk,ppnn,idku)
				filename = application.config['UPLOAD_FOLDER']+'/'+nmft
				path1 = application.config['UPLOAD_FOLDER']+'/'+baris[3]
				openDb()
				cursor.execute("UPDATE menu SET nm_menu='%s', kategori='%s', ft_menu='%s', harga='%s', deskripsi='%s', diskon='%s', ppn='%s' WHERE id_menu='%s'" % data)
				conn.commit()
				closeDb()
				foto.save(filename)
				if os.path.isfile(path1):
					os.remove(path1)
			else:
				openDb()
				cursor.execute("UPDATE menu SET nm_menu='%s', kategori='%s', harga='%s', deskripsi='%s', diskon='%s', ppn='%s' WHERE id_menu='%s'" % data1)
				conn.commit()
				closeDb()
			return redirect(url_for('data_menu'))
		return render_template('ubah_menu.html', baris=baris, container=container)
	else:
		return redirect(url_for('login'))
		
@application.route('/hapus_menu/<id>', methods=['GET', 'POST'])
def hapus_menu(id):
	if 'loggedin' in session:
		try:
			openDb()
			cursor.execute("SELECT ft_menu FROM menu WHERE id_menu='%s'" % (id))
			data = cursor.fetchone()
			path1 = application.config['UPLOAD_FOLDER']+'/'+data[0]
			cursor.execute("DELETE FROM menu WHERE id_menu='%s'" % (id))
			conn.commit()
			closeDb()
			if os.path.isfile(path1):
				os.remove(path1)
			return redirect(url_for('data_menu'))
		except:
			msg = 'Menu Tidak Bisa Dihapus'
			return redirect(url_for('data_menu'))
	else:
		return redirect(url_for('login'))
		
# halaman dan proses pesan
@application.route('/menu', methods=['GET', 'POST'])
def menu():
	openDb()
	cursor.execute("SELECT * FROM menu ORDER BY kategori")
	container = cursor.fetchall()
	closeDb()
	return render_template('menu.html', container=container)

@application.route('/pesan', methods=['GET', 'POST'])
def pesan():
	idmn = request.form.getlist("noid")
	jmla = request.form.getlist("jumlah")
	jmlh = ['0' if i=='' else i for i in jmla]
	comt = request.form.getlist("comment")
	ujih = ['-' if i=='' else i for i in comt]
	menu = request.form.getlist("menu")
	harg = request.form.getlist("harga")
	disk = request.form.getlist("diskon")
	ppnn = request.form.getlist("ppn")
	a = map(int, jmlh)
	b = map(int, harg)
	c = map(int, disk)
	d = map(int, ppnn)
	totl = [e*f for e,f in zip(a,b)]
	dskn = [g*h/100 for g,h in zip(c,totl)]
	pppn = [i*j/100 for i,j in zip(d,totl)]
	if session['loggedin']==True and session['login_as'] == 'member':
		tota = [k-l+m for k,l,m in zip(totl,dskn,pppn)]
	else:
		tota = [n+o for n,o in zip(totl,pppn)]
	data = list(zip(idmn,jmlh,ujih,menu,harg,tota,dskn,pppn))
	contain = [c for c in data if c[1]!="0"]
	total_bayar = 0
	for i in tota:
		total_bayar += i
	if contain==[]:
		return redirect(url_for('menu'))
	return render_template('pesan.html', contain=contain, bayar=total_bayar)

@application.route('/bayar', methods=['GET', 'POST'])
def bayar():
	msg = ''
	dttm = datetime.now().strftime("%Y%m%d%H%M%S")
	trx = 'TR' + dttm[2:14]
	meja = request.form['meja']
	nama = request.form['nama']
	kntk = request.form['kontak']
	if kntk == '':
		kntk = '-'
	idmr = request.form['idmember']
	idmn = request.form.getlist("idmenu")
	bymn = request.form.getlist("bayarmenu")
	comn = request.form.getlist("comment")
	jmlh = request.form.getlist("jumlah")
	bayr = request.form['bayar']
	disk = []
	ppnn = []
	for i in idmn:
		openDb()
		cursor.execute("SELECT * FROM menu WHERE id_menu='%s'" % (i))
		data = cursor.fetchone()
		if idmr == 'no':
			a = '0'
		else:
			a = data[6]
		b = data[7]
		closeDb()
		disk.append(a)
		ppnn.append(b)
	dtil = list(zip(idmn,bymn,jmlh,comn,disk,ppnn))
	# input data jual
	openDb()
	cursor.execute("INSERT INTO jual (no_pesan,id_member,nama_cust,kontak,status_byr,total_byr,status,no_meja,tgl_trx) VALUES ('%s','%s','%s','%s','pesan','%s','belum','%s',now())" % (trx,idmr,nama,kntk,bayr,meja))
	conn.commit()
	cursor.execute("SELECT id_jual FROM jual WHERE no_pesan='%s'" % (trx))
	idjl = cursor.fetchone()
	closeDb()	
	# input data detil_jual
	for i in dtil:
		data = (idjl[0],i[0],i[1],i[2],i[3],i[4],i[5])
		openDb()
		cursor.execute("INSERT INTO detil_jual (id_jual,id_menu,harga,jumlah,comment,diskon,ppn) VALUES ('%s','%s','%s','%s','%s','%s','%s')" % data)
		conn.commit()
		closeDb()
	if 'loggedin' in session:
		if session['login_as']=='member':
			msg = 'Pesanan sedang diproses...'
			return render_template('member.html', psn=msg)
		elif session['login_as']=='kasir':
			return redirect(url_for('data_bayar'))
		else:
			msg = 'Pesanan sedang diproses...'
	return render_template('index.html', msg=msg)

# halaman dan proses pembayaran
@application.route('/data_bayar', methods=['GET', 'POST'])
def data_bayar():
	if 'loggedin' in session:
		openDb()
		cursor.execute("SELECT * FROM jual WHERE status='belum' ORDER BY tgl_trx")
		data = cursor.fetchall()
		closeDb()
		return render_template('data_bayar.html', contain=data)
	else:
		return redirect(url_for('login'))
		
@application.route('/pembayaran/<id>', methods=['GET', 'POST'])
def pembayaran(id):
	msg = ''
	date = datetime.now().strftime("%Y-%m-%d")
	openDb()
	cursor.execute("SELECT * FROM jual WHERE id_jual='%s'" % id)
	data = cursor.fetchone()
	cursor.execute("SELECT * FROM detil_jual WHERE id_jual='%s'" % id)
	dtil = cursor.fetchall()
	nmmn = []
	for i in dtil:
		cursor.execute("SELECT nm_menu,harga FROM menu WHERE id_menu='%s'" % (i[1]))
		a = cursor.fetchone()
		nmmn.append(a)
	closeDb()
	menu = list(zip(nmmn,dtil))
	if request.method == 'POST':
		tngl = request.form['tanggal']
		idjl = data[0]
		idks = session['idkasir']
		if 'bayar' in request.form:
			pbyr = request.form['bayar']	
			if int(pbyr)>=int(data[5]):
				kmbl = int(pbyr)-int(data[5])
				openDb()
				cursor.execute("UPDATE jual SET tgl_jual='%s', id_kasir='%s', bayar='%s', kembali='%s', status_byr='bayar' WHERE id_jual='%s'" % (tngl,idks,pbyr,kmbl,idjl))
				conn.commit()
				closeDb()
				konten = (data[1],data[8],rupiah_format(kmbl),data[0],data[13])
				return render_template('kembali.html', contain=konten)
			else:
				msg = '*) Bayar Kurang'
		else: 
			msg = 'Data Tidak boleh kosong'
	return render_template('pembayaran.html', contain=data, date=date, menu=menu, msg=msg)

@application.route('/simpan/<id>', methods=['GET', 'POST'])
def simpan(id):
	if 'loggedin' in session:
		openDb()
		cursor.execute("UPDATE jual SET status='simpan' WHERE id_jual='%s'" % id)
		conn.commit()	
		closeDb()
		return redirect(url_for('data_bayar'))
	else:
		return redirect(url_for('login'))
		
# halaman dan proses penjualan
@application.route('/data_jual', methods=['GET', 'POST'])
def data_jual():
	kate = 'semua'
	idtrans = ''
	tanggal = (datetime.now().strftime("%Y-%m-%d"),datetime.now().strftime("%Y-%m-%d"))
	openDb()
	cursor.execute("SELECT DISTINCT status FROM jual ORDER BY status")
	status = cursor.fetchall()
	closeDb()
	if session['login_as'] == 'admin':
		if request.method == 'POST':
			tgal = request.form['tglawal']
			tgar = request.form['tglakhir']
			stts = request.form['status']
			tran = request.form['idtrans']
			#idtr = ['0' if tran == '']
			if tran != '':
				openDb()
				cursor.execute("SELECT * FROM jual WHERE no_pesan='%s'" % (tran))
				data1 = cursor.fetchone()
				data = []
				closeDb()
				if data1:
					idtrans = data1[1]
					data.append(data1)
					tanggal = (tgal,tgar)
				else:
					return redirect(url_for('data_jual'))
			else:
				if stts == 'semua':
					openDb()
					cursor.execute("SELECT * FROM jual WHERE tgl_trx>='%s' and tgl_trx<='%s'" % (tgal,tgar))
					data = cursor.fetchall()
					tanggal = (tgal,tgar)
					closeDb()
				else:
					openDb()
					cursor.execute("SELECT * FROM jual WHERE tgl_trx>='%s' and tgl_trx<='%s' and status='%s'" % (tgal,tgar,stts))
					data = cursor.fetchall()
					closeDb()
					tanggal = (tgal,tgar)
					kate = stts
		else:
			openDb()
			cursor.execute("SELECT * FROM jual WHERE tgl_trx>='%s' and tgl_trx<='%s'" % (tanggal[0],tanggal[0]))
			data = cursor.fetchall()
			closeDb()
	elif session['login_as'] == 'kasir':
		openDb()
		cursor.execute("SELECT * FROM jual WHERE status_byr='bayar' AND status='simpan'")
		data = cursor.fetchall()
		closeDb()
	return render_template('data_jual.html', contain=data, status=status, tanggal=tanggal, kate=kate, idtrans=idtrans)

@application.route('/lapor_jual', methods=['GET', 'POST'])
def lapor_jual():
	if 'loggedin' in session:
		date = datetime.now().strftime("%Y-%m-%d")
		openDb()
		idks = session['idkasir']
		cursor.execute("SELECT nm_kasir FROM kasir WHERE id_kasir='%s'" % (idks))
		info = cursor.fetchone()
		nmks = info[0]
		cursor.execute("SELECT total_byr FROM jual WHERE id_kasir='%s' AND status='simpan'" % (idks))
		data = cursor.fetchall()
		closeDb()
		if data:
			total_bayar = 0
			for i in data:
				total_bayar += i[0]
			datak = [date,nmks,rupiah_format(total_bayar),idks]
			return render_template('kirim_jual.html', data=datak)
		return redirect(url_for('data_jual'))
	else:
		return redirect(url_for('login'))
		
@application.route('/lapor_kirim/<id>', methods=['GET', 'POST'])
def lapor_kirim(id):
	if 'loggedin' in session:
		openDb()
		cursor.execute("UPDATE jual SET status='selesai', tgl_trx=now() WHERE id_kasir='%s' AND status='simpan'" % (id))
		conn.commit()
		closeDb()
		return redirect(url_for('data_jual'))
	else:
		return redirect(url_for('login'))
		
@application.route('/hapus_jual/<id>/<par>', methods=['GET', 'POST'])
def hapus_jual(id,par):
	if 'loggedin' in session:
		msg = ''
		if par == 'cek':
			return render_template('hapus_jual.html', id=id)
		elif par == 'ok':
			openDb()
			cursor.execute("SELECT no_pesan FROM jual WHERE id_jual='%s'" % (id))
			pesn = cursor.fetchone()
			path = application.config['PDF_FOLDER']+'/'+pesn[0]+'.pdf'
			path1 = application.config['PDF_FOLDER']+'/'+pesn[0]+'_detail.pdf'
			if os.path.isfile(path) and os.path.isfile(path1):
				os.remove(path)
				os.remove(path1)
			cursor.execute("DELETE FROM jual WHERE id_jual='%s'" % (id))
			conn.commit()
			closeDb()
			return redirect(url_for('data_jual'))
		else:
			msg = 'data tidak dihapus'
		return redirect(url_for('data_jual', msg=msg))
	else:
		return redirect(url_for('login'))
		
# detail jual
@application.route('/detail/<id>', methods=['GET', 'POST'])
def detail(id):
	if 'loggedin' in session:
		openDb()
		cursor.execute("SELECT * FROM jual WHERE id_jual='%s'" % (id))
		data = cursor.fetchone()
		if data[4]:
			cursor.execute("SELECT nm_kasir FROM kasir WHERE id_kasir='%s'" % (data[4]))
			nmks = cursor.fetchone()
		else:
			nmks = [('-')]
		if data[3] == 0:
			nmmb = [('tidak member')]
		else:
			nmmb = [('member')]
		cursor.execute("SELECT * FROM detil_jual WHERE id_jual='%s'" % (data[0]))
		dftr = cursor.fetchall()
		nmmn = []
		for i in dftr:
			cursor.execute("SELECT nm_menu,harga FROM menu WHERE id_menu='%s'" % (i[1]))
			a = cursor.fetchone()
			nmmn.append(a)
		closeDb()
		menu = list(zip(nmmn,dftr))
		if session['login_as']=='admin':
			info1 = ('No.Transaksi','No.Meja','Tanggal Transaksi','Kasir','Status Transaksi'
					,'Nama Pelanggan','Kontak Pelanggan','Status Member','Total Bayar','Jumlah Bayar'
					,'Kembali','Status Bayar','Tanggal Bayar')
			info = (data[1],data[13],data[12],nmks[0],data[11],data[8],data[9],nmmb[0],data[5],data[6],data[7],data[10],data[2])
		else:
			info1 = ('No.Transaksi','No.Meja','Kasir','Status Transaksi'
				,'Nama Pelanggan','Kontak Pelanggan','Status Member','Total Bayar','Jumlah Bayar'
				,'Kembali','Status Bayar','Tanggal Transaksi')
			info = (data[1],data[13],nmks[0],data[11],data[8],data[9],nmmb[0],data[5],data[6],data[7],data[10],data[2])
		info2 = ['-' if i=='' else i for i in info]
		konten = list(zip(info1,info2))
		status = (data[11],data[10],data[0])
		return render_template('detail.html', contain=konten, status=status, pesan=menu)
	else:
		return redirect(url_for('login'))
		
# proses print
@application.route('/cetak/<id>', methods=['GET', 'POST'])
def cetak(id):
	openDb()
	cursor.execute("SELECT * FROM jual WHERE id_jual='%s'" % (id))
	data = cursor.fetchone()
	cursor.execute("SELECT * FROM detil_jual WHERE id_jual='%s'" % (data[0]))
	detl = cursor.fetchall()
	pesn = []
	for j in detl:
		cursor.execute("SELECT nm_menu, harga FROM menu WHERE id_menu='%s'" % (j[1]))
		k = cursor.fetchone()
		pesn.append(k)
	closeDb()
	enum = list(enumerate(zip(pesn,detl),1))
	nama = data[1]
	temp = str(render_template('print.html', data=data, detil=enum))
	pdffile = application.config['PDF_FOLDER']+'/'+nama+'.pdf'
	options = {
		'page-size': 'A4',
		'encoding': "UTF-8",
	}
	pdfkit.from_string(temp,pdffile,options=options)
	return redirect('/static/pdf/'+nama+'.pdf')

@application.route('/cetak_detail/<id>', methods=['GET', 'POST'])
def cetak_detail(id):
	openDb()
	cursor.execute("SELECT * FROM jual WHERE id_jual='%s'" % (id))
	data = cursor.fetchone()
	cursor.execute("SELECT * FROM detil_jual WHERE id_jual='%s'" % (data[0]))
	detl = cursor.fetchall()
	if data[4]:
		cursor.execute("SELECT nm_kasir FROM kasir WHERE id_kasir='%s'" % (data[4]))
		kasir = list(cursor.fetchone())
	else:
		kasir = ['-']
	if data[3]!=0:
		kasir.append('member')
	else:
		kasir.append('tidak member')
	pesn = []
	for j in detl:
		cursor.execute("SELECT nm_menu, harga FROM menu WHERE id_menu='%s'" % (j[1]))
		k = cursor.fetchone()
		pesn.append(k)
	closeDb()
	enum = list(enumerate(zip(pesn,detl),1))
	nama = data[1]
	temp = str(render_template('print_detail.html', data=data, detil=enum, kasir=kasir))
	pdffile = application.config['PDF_FOLDER']+'/'+nama+'_detail.pdf'
	options = {
		'page-size': 'A4',
		'encoding': "UTF-8",
	}
	pdfkit.from_string(temp,pdffile,options=options)
	return redirect('/static/pdf/'+nama+'_detail.pdf')

# proses ganti edit login kasir
@application.route('/pass_kasir', methods=['GET', 'POST'])
def pass_kasir():
	if 'loggedin' in session:
		msg = ''
		username = session['username']
		if request.method == 'POST' and 'passlama' in request.form and 'passbaru1' in request.form and 'passbaru2' in request.form:
			username1 = request.form['username']
			passlama = request.form['passlama']
			passbaru1 = request.form['passbaru1']
			passbaru2 = request.form['passbaru2']
			openDb()
			cursor.execute("SELECT * FROM login WHERE username='%s' and password=password('%s')" % (username,passlama))
			account = cursor.fetchone()
			closeDb()
			if username!=username1 and account:
				msg = '*) Gunakan Username lain.'
			elif account and passbaru1==passbaru2:
				openDb()
				cursor.execute("UPDATE login SET username='%s', password=password('%s') WHERE username='%s' AND password=password('%s')" % (username1,passbaru2,username,passlama))
				conn.commit()
				closeDb()
				msg = '*) Login telah diubah. Silahkan logout dan login ulang'
			elif account:
				msg = '*) Ulangi input password baru.'
			else:
				msg = '*) Password lama salah.'
		return render_template('pass_kasir.html', msg=msg, name=username)
	else:
		return redirect(url_for('login'))

# proses ganti password admin
@application.route('/pass_admin', methods=['GET', 'POST'])
def pass_admin():
	if 'loggedin' in session:
		msg = ''
		if request.method == 'POST' and 'passlama' in request.form and 'passbaru1' in request.form and 'passbaru2' in request.form:
			username = session['username']
			passlama = request.form['passlama']
			passbaru1 = request.form['passbaru1']
			passbaru2 = request.form['passbaru2']
			openDb()
			cursor.execute("SELECT * FROM login WHERE username = '%s' AND password = password('%s')" % (username, passlama))
			pilih = cursor.fetchone()
			if pilih and passbaru1 == passbaru2:
				cursor.execute("UPDATE login SET password = password('%s') WHERE username = '%s'" % (passbaru2, username))
				conn.commit()
				closeDb()
				msg = '*) Password telah diubah'
			elif pilih:
				msg = '*) Ulangi input password baru'
			else:
				msg = '*) Password lama salah'
		return render_template('pass_admin.html', msg=msg)
	else:
		return redirect(url_for('login'))

# fungsi logout
@application.route('/logout')
def logout():
	session.pop('loggedin', None)
	session.pop('username', None)
	session.pop('login_as', None)
	return redirect(url_for('index'))

if __name__ == '__main__':
	application.debug = True
	application.run(host='0.0.0.0', port=5000)
