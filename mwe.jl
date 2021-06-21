using SymbolicRegression,
    Random,
    Distributions

Random.seed!(3)
x = rand(Uniform(-3 , 3), (2, 30))
f = x -> 2.5*x[1]^4 - 1.3*x[1]^3 + 0.5*x[2]^2 - 1.7*x[2]
y = f.(eachcol(x))

sq(x) = x^2
cb(x) = x^3

opt = Options(binary_operators = (+, -, *, /),
              unary_operators = (sin, cos, exp, sq, cb),
              progress = true,
              recorder = true,
              recorder_file = "./recorder.json")


hof = EquationSearch(x, y,
                     niterations = 5,
                     options = opt)
