from flask import Flask, flash, redirect, render_template, request, session, abort
#from flask import Flask
app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/partner/<string:program>")
def partner(program):
    return render_template(
            # pass multiple variables to the function
            'partner.html', **locals())

@app.route('/signup', methods = ['POST'])
def signup():
    program = request.form['partner']
    return redirect("/partner/" + program)

@app.route("/work")
def work():
    return render_template('work.html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)
