from sympy import symbols, Rational, expand, factor
from sympy import solve

# Определим переменную и многочлен
s = symbols('s')
polynomial = s**4 + s**3 - 2*s**2 + Rational(81, 20)

# Попробуем разложить многочлен на множители
rational_roots = solve(20*s**4 + 20*s**3 - 40*s**2 + 81, s)
print(rational_roots)
