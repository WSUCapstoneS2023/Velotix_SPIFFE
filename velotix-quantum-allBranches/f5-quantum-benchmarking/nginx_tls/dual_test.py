import numpy as np
import subprocess

n_iter = 5

oqs_rps_mean = []
oqs_rps_percent = []
vanilla_rps_mean = []
vanilla_rps_percent = []

for i in range(n_iter):
    print('Beginning iteration %d...' % (int(i + 1)))
    # test nginx-oqs
    cmd = subprocess.run(['h2load', '-n100000', '-c100', '--h1', 'https://54.153.101.5:443'], capture_output = True).stdout
    parsed = cmd.splitlines()
    for line in parsed:
        if 'req/s' in line.decode('utf-8').split():
            temp = line.decode('utf-8').split()
            oqs_rps_mean.append(float(temp[4][:-2]))
            oqs_rps_percent.append(float(temp[6][:-2]))

    cmd = subprocess.run(['h2load', '-n100000', '-c100', '--h1', 'https://54.241.193.18:80'], capture_output = True).stdout
    parsed = cmd.splitlines()
    for line in parsed:
        if 'req/s' in line.decode('utf-8').split():
            temp = line.decode('utf-8').split()
            vanilla_rps_mean.append(float(temp[4][:-2]))
            vanilla_rps_percent.append(float(temp[6][:-2]))


print(oqs_rps_mean)
print(oqs_rps_percent)
print(vanilla_rps_mean)
print(vanilla_rps_percent)
print('OQS Mean RPS: %f' % (np.mean(oqs_rps_mean)))
print('OQS Mean +/- sd: %f' % (np.mean(oqs_rps_percent)))
print('Vanilla Mean RPS: %f' % (np.mean(vanilla_rps_mean)))
print('Vanilla Mean +/- sd: %f' % (np.mean(vanilla_rps_percent)))

#['h2load', '--h1', 'https://localhost:4433']