def Extend_Euclid (a, b):
    if b == 0 :
        print(f"(a, b, a//b) = ({a}, 0, -)")
        return (a, 1, 0) 
    else:
        quotient = a // b
        print(f"(a, b, a//b) = {a, b, quotient}")
        (dd, xx, yy) = Extend_Euclid (b, (a % b))
    (d, x, y) = (dd, yy, (xx - (a // b) * yy))
    print (f"(a, b, a//b) = {a, b, quotient}, (dd, xx, yy) = ({dd}, {xx}, {yy}), (d, x, y) = ({d}, {x}, {y})")

    return (d, x, y)    
    
def extended_gcd (a, b):
    (old_r, r) = (a, b)
    (old_s, s) = (1, 0)
    (old_t, t) = (0, 1)

    while r != 0:
        quotient = old_r // r
        (old_r, r) = (r, old_r - quotient * r)
        (old_s, s) = (s, old_s - quotient * s)
        (old_t, t) = (t, old_t - quotient * t)

    print (f"Bezout coefficients = {old_s, old_t}")
    print (f"greated common diviser = {old_r}")
    print (f"quotients by the gcd = {t, s}")


# gcd = Extend_Euclid (99, 78)
gcd = Extend_Euclid (35, 50)
print(gcd)
    
# extended_gcd (99, 78)