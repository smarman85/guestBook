from flask import Flask, flash, redirect, render_template, request, session, abort
import program_info
#from flask import Flask
app = Flask(__name__)

@app.route("/")
def index():
    payload = program_info.apiCall('groups')
    return render_template(
            'index.html',
            **locals()
            )

@app.route("/partner/<string:program>")
def partnerInfo(program):
    payload = program_info.apiCall("groups/" + program)
    return render_template(
            # pass multiple variables to the function
            'partner.html',
            **locals()
            )

@app.route('/lookup', methods = ['POST'])
def signup():
    program = request.form['partner']
    return redirect("/partner/" + program)

@app.route("/host/<string:hostname>")
def hostInfo(hostname):
    payload = program_info.apiCall("hosts/" + hostname)
    return render_template(
            'host.html',
            **locals()
            )

@app.errorhandler(404)
def pageNotFound(error):
    return "page not found"

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)
    #app.run(host='0.0.0.0', debug=False)
