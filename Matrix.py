import numpy as np
import cmath

V = [
    [1, 1, 1, 1],
    [1, 1j, -1, -1j],
    [1, -1, 1, -1],
    [1, -1j, -1, 1j]
]

V_inv = np.linalg.inv(V)

print (f"V = \n {V}")
print (f"V_inv = \n {V_inv}")