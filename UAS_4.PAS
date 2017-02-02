program nilai_siswa;
uses crt;

var
  nama, npm : array[1..30] of string;
  nilai_absensi, nilai_tugas, nilai_quiz, nilai_uts, nilai_uas, nilai_akhir : array[1..30] of real;
  i, ii : integer;
  status : string;
  y : integer;
  average : real;

function huruf_mutu(nilai : real): string;
begin
  if (nilai >= 86) then
    huruf_mutu := 'A'
  else if (nilai >= 71) and (nilai <= 85) then
    huruf_mutu := 'B'
  else if (nilai >= 56) and (nilai <= 71) then
    huruf_mutu := 'C'
  else if (nilai >= 26) and (nilai <= 55) then
    huruf_mutu := 'D'
  else if nilai <= 25 then
    huruf_mutu := 'E'
  else
    huruf_mutu := '?';
end;

begin
  clrscr;
  status := 'y';
  i := 1;
  average := 0;

  while(status = 'y') do
  begin
    write('NPM : ');            readln(npm[i]);
    write('Nama : ');           readln(nama[i]);
    write('Nilai Absensi : ');  readln(nilai_absensi[i]);
    write('Nilai Tugas : ');    readln(nilai_tugas[i]);
    write('Nilai Quiz : ');     readln(nilai_quiz[i]);
    write('Nilai UTS : ');      readln(nilai_uts[i]);
    write('Nilai UAS : ');      readln(nilai_uas[i]);

    nilai_akhir[i] := 0.1 * nilai_absensi[i] + 0.15 * nilai_tugas[i] + 0.1 * nilai_quiz[i] + 0.3 * nilai_uts[i];
    nilai_akhir[i] := nilai_akhir[i] + 0.35 * nilai_uas[i];

    i := i + 1;
    write('Lanjut masukkan data ? (y/n)'); readln(status);
  end;

  clrscr;
  writeln('UNIVERSITAS INFORMATIKA DAN BISNIS INDONESIA');
  writeln('DAFTAR NILAI MATA KULIAH STRUKTUR DATA');
  writeln(' ');
  writeln('KELAS MI 1A Tahun Akademik: 2016 / 2017');
  writeln(' ');

  y := 8;

  GotoXY(1, y);
  write('No');
  GotoXY(5, y);
  write('NPM');
  GotoXY(10, y);
  write('Nama');
  GotoXY(20, y);
  write('NAbs');
  GotoXY(28, y);
  write('NTgs');
  GotoXY(36, y);
  write('NQz');
  GotoXY(44, y);
  write('NUTS');
  GotoXY(52, y);
  write('NUAS');
  GotoXY(60, y);
  write('NAkhir');
  GotoXY(68, y);
  write('HMutu');

  for ii := 1 to (i - 1) do
  begin
    GotoXY(1, y + ii);
    write(ii);
    GotoXY(5, y + ii);
    write(npm[ii]);
    GotoXY(10, y + ii);
    write(nama[ii]);
    GotoXY(20, y + ii);
    write(nilai_absensi[ii]:3:1);
    GotoXY(28, y + ii);
    write(nilai_tugas[ii]:3:1);
    GotoXY(36, y + ii);
    write(nilai_quiz[ii]:3:1);
    GotoXY(44, y + ii);
    write(nilai_uts[ii]:3:1);
    GotoXY(52, y + ii);
    write(nilai_uas[ii]:3:1);
    GotoXY(60, y + ii);
    write(nilai_akhir[ii]:3:1);
    GotoXY(68, y + ii);
    write(huruf_mutu(nilai_akhir[ii]));

    average := average + nilai_akhir[ii];
  end;

  average := average / (i - 1);

  GotoXY(1, y + ii + 2);
  write('Jumlah Mahasiswa : ', i - 1);
  GotoXY(1, y + ii + 3);
  write('Nilai rata-rata : ', average:3:1);

  readln;
end.
