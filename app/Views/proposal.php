<?= $this->extend('welcome_message') ?>
<?= $this->section('content') ?>
   <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>Daftar Proposal</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <?php 
                $url =  base_url('Prop');
                $ch = curl_init();
                curl_setopt($ch,CURLOPT_URL,$url);
                curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
                curl_setopt($ch,CURLOPT_CONNECTTIMEOUT, 4);
                $json = curl_exec($ch);
                if(!$json) {
                    echo curl_error($ch);
                }
                curl_close($ch);
                $temp = json_decode($json);
                ?>
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">NRP</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">NAMA</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">PEMBIMBING</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">JUDUL</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">STATUS</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($temp as $key) { 
                      $clsStat = $key->status=='Diajukan' ? 'badge badge-sm bg-gradient-warning' : 'badge badge-sm bg-gradient-success';
                      ?>
                    <tr>
                      <td class="text-sm">
                        <p class="text-xs font-weight-bold mb-0"><?= $key->nrp?></p>
                      </td>
                      <td class="text-sm">
                        <p class="text-xs font-weight-bold mb-0"><?= $key->nama?></p>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0"> 1 : <?= $key->pembSatu?></p>
                        <p class="text-xs font-weight-bold mb-0"> 2 : <?= $key->pembDua?></p>
                      </td>
                      <td class="text-sm">
                        <span class="text-secondary text-xs font-weight-bold"><textarea readonly rows="5"><?= $key->jdlTA?></textarea> </span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="<?=$clsStat?>"><?= $key->status?></span>
                      </td>
                      <td class="align-middle">
                        <a href="<?= base_url('Detailta').'/'.$key->idProp ?>" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          <i class="ni ni-single-copy-04"></i><span class="text-secondary text-xs">Detail</span>
                        </a>
                      </td>
                    </tr>
                  <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

<?= $this->endSection() ?>