import math


def vec_matrix(v, M):
    n = len(M)
    m = len(v)
    res = [0]*n
    for i in range(n):
        for j in range(m):
            res[i] += M[i][j] * v[j]
    return res

def power_method(A, q, to_latex=True):
    j = 0
    while j<10:
        p = vec_matrix(q, A)
        plinha = [abs(x) for x in p]
        sig = max(plinha)

        if to_latex:
            print("& & & \\\ [-1em]")
            print(j, " & $\\begin{bmatrix} ", end="")
            for i in range(len(q)):
                print('{:.6}'.format(q[i]), end="")
                if i < (len(q) - 1):
                    print(" & ", end="")
            print(" \end{bmatrix}$ & $\\begin{bmatrix} ", end="") 
            for i in range(len(p)):
                print('{:.6}'.format(p[i]), end="")
                if i < (len(p) - 1):
                    print(" & ", end="")
            print(" \end{bmatrix}$  & ", end="") 
            print('{:.6}'.format(sig), end="")
            print(" \\\ [+.5em]")
            print("\hline")

        q = [x/sig for x in p]
        j += 1

def ratios(A, q):
    j = 0
    ques = [q.copy()]
    while j<7:
        p = vec_matrix(q, A)
        plinha = [abs(x) for x in p]
        sig = max(plinha)

        q = [x/sig for x in p]
        ques.append(q.copy())
        j += 1
    return ques

if __name__ == "__main__":
    q = [1.0, 1.0]
    A = [[-3.5, -0.5], [1, 0]]
    # power_method(A, q)
    ques = ratios(A,q)
    v = ques[-1]
    for j in range(len(ques) - 1):
        a = abs(ques[j+1][0]) - abs(v[0])
        b = abs(ques[j+1][1]) - abs(v[1])
        c = abs(ques[j][0]) - abs(v[0])
        d = abs(ques[j][1]) - abs(v[1])
        print('{:.6}'.format(math.sqrt(a**2 + b**2)/math.sqrt(c**2 + d**2)))