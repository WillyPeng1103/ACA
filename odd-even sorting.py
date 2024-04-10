import numpy as np

def mergeBU (a, l, r):
    N = r - l + 1
    # for k in range(N/2, k>0, k= k/2):
    #     for j in range(k%(N/2), j+k<N, j = j + (k+k)):
    #         for i in range (k):
    #             compexch (a[l + j + i], a[l + j + i + k])
    
    k = N // 2
    while k > 0:
        print (f"k = {k}")
        j = k % (N // 2)
        while j < N - k:
            print (f"j = {j}")
            for i in range(k):
                print (f"i = {i}")
                a[l + j + i], a[l + j + i + k] = compexch (a[l + j + i], a[l + j + i + k])
                print (f"a = {a}")
            j  = j + k + k
        k = k // 2
    return a
        

def shuffle(a, l, r):
    m = (l + r) // 2
    i = l
    j = 0
    aux = np.zeros(len(a), dtype=int)
    while i <= r:
        aux[i] = a[l + j]
        aux[i+1] = a[m + 1 + j]
        i += 2
        j += 1
    i = l
    while i <= r:
        a[i] = aux[i]
        i += 1
    return a

def unshuffle (a, l, r):
    m = (l + r) // 2
    i = l
    j = 0
    aux = np.zeros(len(a), dtype=int)
    while i <= r:
        aux[l + j] = a[i]
        aux[m + 1 + j] = a[i + 1]
        i += 2
        j += 1
    i = l
    while i <= r:
        a[i] = aux[i]
        i += 1
    return a

def compexch (a, b):
    if a > b:
        a, b = b, a
    return a, b

def mergeTD (a, l ,r):
    m = (l + r) //2
    if (r == (l + 1)):
        a[l], a[r] = compexch(a[l], a[r])
    if (r < (l + 2)):
        return 
    unshuffle (a, l, r)
    mergeTD (a, l, m)
    mergeTD (a, m + 1, r)
    shuffle (a, l, r)
    i = l + 1
    while i < r:
        a[i], a[i+1] = compexch(a[i], a[i+1])
        i = i + 2
    return a

a = [8, 7, 6, 5, 4, 3, 2, 1]
# a = [1, 2, 3, 4, 5, 6, 7, 8]

print (a)
# a = mergeBU(a, 0, 7)
# a = shuffle(a, 0, 7)
# a = unshuffle(a, 0, 7)
a = mergeTD(a, 0, 7)
print (a)

#test the compexch function
# a = 6
# b = 2
# a, b = compexch(a, b)
# print (a, b)