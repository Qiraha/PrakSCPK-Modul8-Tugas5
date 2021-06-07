function [RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
    indeksAcak = [0 0 0.58 0.9 1.12 1.24 1.32 1.41 1.45 1.49];
    
    [op, jumlahKriteria] = size(relasiAntarKriteria);
    [opp, lambda] = eig(relasiAntarKriteria);
    maksLambda = max(max(lambda));
    IndeksKonsistensi = (maksLambda - jumlahKriteria)/(jumlahKriteria - 1);
    RasioKonsistensi = IndeksKonsistensi / indeksAcak(1,jumlahKriteria);
    
    if RasioKonsistensi > 0.10
        str = 'Matriks yang dievaluasi tidak konsisten!';
        str = printf(str,RasioKonsistensi);
        disp(str);
    end  
end