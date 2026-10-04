import '../errors/_errors.dart';

/// User-facing Indonesian text (CLAUDE.md section 5). Defined once here so the
/// wording stays consistent across features. Developer messages stay in English.
class AppStrings {
  const AppStrings._();

  static const appTitle = 'NuroPulse';
  static const start = 'Mulai';
  static const cancel = 'Batal';
  static const retry = 'Ulangi';
  static const processing = 'Memproses…';
  static const result = 'Hasil';
  static const savedSessions = 'Riwayat sesi';
  static const sessionDetail = 'Detail sesi';
  static const measure = 'Pengukuran';
  static const export = 'Ekspor';
  static const delete = 'Hapus';
  static const deleteConfirm = 'Hapus sesi ini?';
  static const noSessions = 'Belum ada sesi tersimpan.';
  static const genericError = 'Terjadi kesalahan. Silakan coba lagi.';
  static const exportFailed = 'Gagal mengekspor sesi.';
  static const uncalibrated = 'Ambang belum dikalibrasi';
  static const interrupted =
      'Rekaman dihentikan karena aplikasi keluar dari layar.';
  static const recording = 'Merekam… tahan tangan tetap rileks';

  static String countdown(int seconds) => 'Bersiap… mulai dalam $seconds detik';

  static const decisionNone = 'Tremor ritmis tidak terdeteksi.';
  static const decisionTremor =
      'Tremor ritmis terdeteksi. Perlu evaluasi lebih lanjut.';
  static const decisionInvalid = 'Pengukuran tidak valid. Silakan ulangi.';

  static const gateSampling = 'Kecepatan sampling sensor terlalu rendah';
  static const gateDataGap = 'Ada jeda data yang terlalu panjang';
  static const gateFlatSignal = 'Sinyal sensor tidak berubah sama sekali';

  static const featureLabels = (
    peak: 'Frekuensi puncak',
    ratio: 'Rasio daya pita tremor',
    snr: 'SNR',
    rms: 'RMS pita tremor',
    consistency: 'Konsistensi',
  );

  static const signalBeforeFilter = 'Sinyal sebelum filter (sumbu X)';
  static const signalAfterFilter = 'Sinyal sesudah filter (sumbu X)';
  static const spectrumTitle = 'Spektrum (pita tremor disorot)';
  static const spectrumFrequency = 'Frekuensi';
  static const spectrumPower = 'Daya (PSD)';
  static const tremorBandTag = 'Pita tremor';
  static const qualityGates = 'Pemeriksaan kualitas';
  static const metadata = 'Metadata';

  static const subjectCode = 'Kode subjek';
  static const hand = 'Tangan';
  static const handLeft = 'Kiri';
  static const handRight = 'Kanan';
  static const condition = 'Kondisi';
  static const repetition = 'Ulangan';
  static const simulatedFrequency = 'Frekuensi simulasi (Hz)';
  static const notes = 'Catatan';
  static const subjectRequired = 'Kode subjek wajib diisi';
  static const repetitionInvalid = 'Ulangan harus angka minimal 1';
  static const simulatedFrequencyInvalid =
      'Masukkan frekuensi simulasi yang valid';
  static const protocol =
      'Letakkan ponsel di punggung tangan, duduk, lengan ditopang, tangan santai. '
      'Jangan sentuh layar dan jangan menggetarkan ponsel selama rekaman.';

  static const conditionRest = 'Istirahat';
  static const conditionPostural = 'Postural (lengan terentang)';
  static const conditionNoiseFloor = 'Noise floor (ponsel di meja)';
  static const conditionSimulated = 'Simulasi';

  static const createdAt = 'Waktu';
  static const device = 'Perangkat';
  static const effectiveFs = 'Sampling efektif';
  static const jitter = 'Jitter';
  static const maxGap = 'Gap maksimum';
  static const algoVersion = 'Versi algoritma';

  static String failure(Failure failure) {
    return switch (failure) {
      ExportFailure() => exportFailed,
      _ => genericError,
    };
  }
}
