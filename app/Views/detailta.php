<?= $this->extend('welcome_message') ?>
<?= $this->section('content') ?>
<div class="row">
  <div class="col-md-8">
    <div class="card">
      <div class="card-header pb-0">
        <div class="d-flex align-items-center">
          <p class="mb-0">Detail Proposal / TA</p>
          <a href="<?= base_url('Proposal') ?>" class="btn btn-primary btn-sm ms-auto">Kembali</a>
        </div>
      </div>
      <div class="card-body">
        <p class="text-uppercase text-sm">Identitas Mahasiswa</p>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="example-text-input" class="form-control-label">NRP</label>
              <input class="form-control" type="text" value="<?=$det[0]->nrp?>" disabled>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="example-text-input" class="form-control-label">Nama</label>
              <input class="form-control" type="text" value="<?=$det[0]->nama?>" disabled>
            </div>
          </div>
        </div>
        <hr class="horizontal dark">
        <p class="text-uppercase text-sm">Informasi Proposal / TA</p>
        <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label for="example-text-input" class="form-control-label">Judul</label>
              <textarea class="form-control" readonly rows="5"><?=$det[0]->jdlTA?></textarea>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="example-text-input" class="form-control-label">Pembimbing 1</label>
              <input class="form-control" type="text" value="<?=$det[0]->pembSatu?>" disabled>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="example-text-input" class="form-control-label">Pembimbing 2</label>
              <input class="form-control" type="text" value="<?=$det[0]->pembDua?>" readonly>
            </div>
          </div>
        </div>
        <hr class="horizontal dark">
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card card-profile">
      <img src="<?=base_url('assets/img/bg-profile.jpg')?>" alt="Image placeholder" class="card-img-top">
      <div class="row justify-content-center">
        <div class="col-4 col-lg-4 order-lg-2">
          <!-- <div class="mt-n4 mt-lg-n6 mb-4 mb-lg-0">
            <a href="javascript:;">
              <img src="../assets/img/team-2.jpg" class="rounded-circle img-fluid border border-2 border-white">
            </a>
          </div> -->
        </div>
      </div>
      <?php 
        $btnCls = $det[0]->status=='Diajukan' ? 'btn-success' : 'btn-danger';
        $btnTxt = $det[0]->status=='Diajukan' ? 'Validasi' : 'Batalkan';
        $btnIc = $det[0]->status=='Diajukan' ? 'ni-check-bold' : 'ni-fat-remove';
        $bgCls = $det[0]->status=='Diajukan' ? 'bg-gradient-warning' : 'bg-gradient-success';
        $bgTxt = $det[0]->status=='Diajukan' ? 'Belum Divalidasi' : 'Sudah Divalidasi';
        $val = $det[0]->status=='Diajukan' ? 'Disetujui' : 'Diajukan';
      ?>
      <div class="card-header text-center border-0 pt-0 pt-lg-2 pb-4 pb-lg-3">
        <div class="d-flex justify-content-between">
          <a href="javascript:;" class="btn btn-sm btn-info mb-0 d-none d-lg-block"><i class="ni ni-cloud-download-95"> Baca Proposal</i></a>
          <form method="POST" action="">
            <input type="hidden" name="idProp" value="<?=$det[0]->idProp?>">
            <input type="hidden" name="status" value="<?=$val?>">
          <button onclick="confirm('Anda yakin akan mengubah status Proposal TA ini?')" type="submit" class="btn btn-sm <?=$btnCls?> float-right mb-0 d-none d-lg-block"><i class="ni <?=$btnIc?>"><?=$btnTxt?></i></button>
          </form>
        </div>
      </div>
      <div class="card-body pt-0">
        <div class="row">
          <div class="col">
          <div class="text-center mt-4">
            <hr class="horizontal dark">
              <div class="d-grid text-center">
                <span class="badge badge-lg <?=$bgCls?>"><?=$bgTxt?></span>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<?= $this->endSection() ?>