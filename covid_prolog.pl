nome(eduardo).
nome(joao).
nome(gustavo).
nome(mateus).

temperatura(eduardo, 43).
temperatura(joao, 34).
temperatura(gustavo, 35).
temperatura(mateus, 42).

freq_cardiaca(eduardo, 118).
freq_cardiaca(joao, 89).
freq_cardiaca(gustavo, 92).
freq_cardiaca(mateus, 176).

freq_respiratoria(eduardo, 29).
freq_respiratoria(joao, 19).
freq_respiratoria(gustavo, 23).
freq_respiratoria(mateus, 41).

pa_sistolica(eduardo, 102).
pa_sistolica(joao, 106).
pa_sistolica(gustavo, 122).
pa_sistolica(mateus, 77).

sa_O2(eduardo, 102).
sa_O2(joao, 100).
sa_O2(gustavo, 99).
sa_O2(mateus, 98).

idade(eduardo, 52).
idade(joao, 62).
idade(gustavo, 58).
idade(mateus, 64).

dispneia(eduardo, "Nao").
dispneia(joao, "Nao").
dispneia(gustavo, "Nao").
dispneia(mateus, "Nao").


quant_comorbidades(eduardo, 2).
quant_comorbidades(joao, 1).
quant_comorbidades(gustavo, 0).
quant_comorbidades(mateus, 5).

caso_grave(P):-
    (freq_respiratoria(P, FR), FR > 30);
    (pa_sistolica(P, PS), PS < 90);
    (sa_O2(P, S02), S02 < 95);
    (dispneia(P, D), D = "Sim").

caso_medio(P):-
    (temperatura(P, T), T > 39);
    (pa_sistolica(P, PS), PS >= 90, PS =< 100);
    (idade(P, I), I >= 80);
    (quant_comorbidades(P, QC), QC >= 2).

caso_leve(P):-
    (temperatura(P, T), T >= 37, T =< 39);
    (freq_cardiaca(P, FC), FC > 100);
    (freq_respiratoria(P, FR), FR >= 19, FR =< 30);
    (idade(P, I), I >= 60, I =< 79);
    (quant_comorbidades(P, QC), QC = 1).

result_grave(P):-
    caso_grave(P),
    write("Caso Grave, deve ser encaminhado para o hospital").

result_medio(P):-
    caso_medio(P),
    write("Caso Medio, deve ficar em casa, em observacao por 14 dias.").

result_leve(P):-
    caso_leve(P),
    write("Caso Leve, deve ficar em casa, em observacao por 14 dias.").

teste_paciente(P) :-
    result_grave(P);
    result_medio(P);
    result_leve(P);
    write("Paciente não teve nenhuma alteração clínica.").
