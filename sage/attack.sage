def recover_a(x1, x2, x3, m):
    a = (x2 - x3) * inverse_mod(x1 - x2, m)
    return a % m

def recover_c(x1,x2, a, m):
    return (x2-a*x1) % m

def predict_next(x, a, c, m):
    return(a*x + c) % m 

def differences(outputs):
    L = []
    for i in range(1, len(outputs)):
        L.append(outputs[i] - outputs[i-1])
    return L


def compute_z(d):
    if len(outputs) < 4:
        raise ValueError("Pas assez de sorties pour calculer un z_i")

    Z = []
    for i in range(1, len(d)-1):
        Z.append(d[i]^2 - d[i-1]*d[i+1])
    return Z

def recover_m(outputs):
    d = differences(outputs)
    Z = compute_z(d)
    m = abs(gcd(Z))
    return m


def crack_lcg(outputs):
    m = recover_m(outputs)
    a = recover_a(outputs[0], outputs[1], outputs[2], m)
    c = recover_c(outputs[0], outputs[1], a, m)
    return m, a, c


outputs=[879516355
,1529767007
,10521500
,1077198153
,410510997
,944737663
,1616498973
,1203624283
,2125191100]

m, a, c = crack_lcg(outputs)


print("Module retrouvé :", m)
print("Multiplicateur retrouvé :", a)
print("Incrément retrouvé :", c)

prediction = predict_next(outputs[-1], a, c, m)
print("Prochaine sortie prédite :", prediction)