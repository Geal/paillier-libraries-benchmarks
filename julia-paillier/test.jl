include("paillier.jl")

n_runs = 100

p = 148677972634832330983979593310074301486537017973460461278300587514468301043894574906886127642530475786889672304776052879927627556769456140664043088700743909632312483413393134504352834240399191134336344285483935856491230340093391784574980688823380828143810804684752914935441384845195613674104960646037368551517
q = 158741574437007245654463598139927898730476924736461654463975966787719309357536545869203069369466212089132653564188443272208127277664424448947476335413293018778018615899291704693105620242763173357203898195318179150836424196645745308205164116144020613415407736216097185962171301808761138424668335445923774195463


plain_1 = 829245798456294852
plain_2 = 148677972634832330983979593310074301486537017973460461278300587514468301043894574906886127642530475786889672304776052879927627556769456140664043088700743909632312483413393134504352834240399191134336344285483935856491230340093391784574980688823380828143810804684752914935441384845195613674104960646037368551517
plain_3 = plain_2^2 


println("################# Encryption bench #################")


pub = PublicEncryptionKey(p,q)

println()
println("Encrypting ", plain_1)
println()
encrypted_1 = encrypt(pub,plain_1)
total_time = 0.0
for i=1:n_runs
    tic()
    encrypt(pub,plain_1)
    total_time += toq()
end
total_time = total_time / 100.0
println("Average time (in miliseconds) over 100 runs: ", total_time * 1000.0)


println()
println("Encrypting ", plain_2)
println()
encrypted_2 = encrypt(pub,plain_2)
total_time = 0.0
for i=1:n_runs
    tic()
    encrypt(pub,plain_2)
    total_time += toq()
end
total_time = total_time / 100.0
println("Average time (in miliseconds) over 100 runs: ",total_time * 1000.0)



println()
println("Encrypting ", plain_3)
println()
encrypted_3 = encrypt(pub, plain_3)
total_time = 0.0
for i=1:n_runs
    tic()
    encrypt(pub, plain_3)
    total_time += toq()
end
total_time = total_time / 100.0
println("Average time (in miliseconds) over 100 runs: ",total_time * 1000.0)






println("################# Decryption bench #################")

priv = PrivateEncryptionKey(p,q,pub.n)

println()
println("Decrypting ", encrypted_1)
println()
decrypted_1 = decrypt(priv,pub,encrypted_1)
@assert decrypted_1 == plain_1
total_time = 0.0
for i=1:n_runs
    tic()
    decrypt(priv,pub,encrypted_1)
    total_time += toq()
end
total_time = total_time / 100.0
println("Average time (in miliseconds) over 100 runs: ", total_time * 1000.0)


println()
println("Decrypting ", encrypted_2)
println()
decrypted_2 = decrypt(priv,pub,encrypted_2)
@assert decrypted_2 == plain_2
total_time = 0.0
for i=1:n_runs
    tic()
    decrypt(priv,pub,encrypted_2)
    total_time += toq()
end
total_time = total_time / 100.0
println("Average time (in miliseconds) over 100 runs: ",total_time * 1000.0)


println()
println("Decrypting ", encrypted_3)
println()
decrypted_3 = decrypt(priv, pub, encrypted_3)
@assert decrypted_3 == plain_3
total_time = 0.0
for i=1:n_runs
    tic()
    decrypt(priv, pub, encrypted_3)
    total_time += toq()
end
total_time = total_time / 100.0
println("Average time (in miliseconds) over 100 runs: ",total_time * 1000.0)