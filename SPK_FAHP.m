%Kualitas skill pegawai Toko RPG be Like

namaPegawai = {'Qiraha' 'Rifqi' 'Nugraha'};

%data intelijen, disiplin, strength
data = [ 80 65 50
         60 60 60
         70 90 75];
maxInt = 100;
maxDis = 100;
maxStr = 100;

data(:,1) = data(:,1)/maxInt;
data(:,2) = data(:,2)/maxDis;
data(:,3) = data(:,3)/maxStr;

relasiAntarKriteria = [ 1 2 2
                        0 1 4
                        0 0 1];
                    
TFN = {[-100/3 0     100/3] [3/100 0     -3/100]
       [0      100/3 200/3] [3/200 3/100 0     ]
       [100/3  200/3 300/3] [3/300 3/200 3/100 ]
       [200/3  300/3 400/3] [3/400 3/300 3/200 ]};
   
[RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)

if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);    

    % Hitung nilai skor akhir 
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan kualitas skill Pegawai Toko RPG be Like')
    disp('Nama Karyawan, Skor Akhir, Kesimpulan')
end

for i = 1:size(ahp, 1)
    if ahp(i) < 0.5
        status = 'Kurang';
    elseif ahp(i) < 0.65
        status = 'Cukup';
    elseif ahp(i) < 0.8
        status = 'Baik';
    else
        status = 'Sangat Baik';
    end
    
    disp([char(namaPegawai(i)), blanks(12 - cellfun('length',namaPegawai(i))), ', ', num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', char(status)])
end