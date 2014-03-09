<div class="row-fluid">
    <div class="span12">
        <ul class="breadcrumb">
            <li><a href="admin.php">Home</a> <span class="divider">/</span></li>
            <li><a href="admin.php?w=fm"><?php echo $gsprache->fastdownload." ".$gsprache->master;?></a> <span class="divider">/</span></li>
            <li class="active"><?php echo $gsprache->add;?></li>
        </ul>
    </div>
</div>
<div class="alert alert-info">
    <?php echo $sprache->help_fdl_master;?>
</div>
<?php if (count($errors)>0){ ?>
<div class="alert alert-error">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>Error(s)</h4>
    <?php echo implode(', ',$errors);?>
</div>
<?php }?>
<div class="row-fluid">
    <div class="span11">
        <form class="form-horizontal" action="admin.php?w=fm&amp;d=ad&amp;r=fm" onsubmit="return confirm('<?php echo $gsprache->sure; ?>');" method="post">
            <input type="hidden" name="token" value="<?php echo token();?>">
            <input type="hidden" name="action" value="ad">
            <div class="control-group">
                <label class="control-label" for="inputActive"><?php echo $dedicatedLanguage->active;?></label>
                <div class="controls">
                    <select id="inputActive" class="span11" name="active">
                        <option value="Y"><?php echo $gsprache->yes;?></option>
                        <option value="N" <?php if ($active=="N") echo 'selected="selected";'?>><?php echo $gsprache->no;?></option>
                    </select>
                </div>
            </div>
            <div class="control-group<?php if(isset($errors['ip'])) echo ' error';?>">
                <label class="control-label" for="inputSshIP"><?php echo $dedicatedLanguage->ssh_ip;?></label>
                <div class="controls"><input id="inputSshIP" class="span11" type="text" name="ip" value="<?php echo $ip;?>" maxlength="15" required></div>
            </div>
            <div class="control-group<?php if(isset($errors['port'])) echo ' error';?>">
                <label class="control-label" for="inputSshPort"><?php echo $dedicatedLanguage->ssh_port;?></label>
                <div class="controls"><input id="inputSshPort" class="span11" type="number" name="port" value="<?php echo $port;?>" maxlength="5" required></div>
            </div>
            <div class="control-group<?php if(isset($errors['user'])) echo ' error';?>">
                <label class="control-label" for="inputSshUser"><?php echo $dedicatedLanguage->ssh_user;?></label>
                <div class="controls"><input id="inputSshUser" class="span11" type="text" name="user" value="<?php echo $user;?>" required></div>
            </div>
            <div class="control-group<?php if(isset($errors['publickey'])) echo ' error';?>">
                <label class="control-label" for="inputKeyUse"><?php echo $dedicatedLanguage->keyuse;?></label>
                <div class="controls">
                    <select id="inputKeyUse" class="span11" name="publickey" onchange="SwitchShowHideRows(this.value);">
                        <option value="N"><?php echo $gsprache->no;?></option>
                        <option value="Y" <?php if ($publickey=='Y') echo 'selected="selected"';?>><?php echo $gsprache->yes;?></option>
                        <option value="B" <?php if ($publickey=='B') echo 'selected="selected"'; ?>><?php echo $gsprache->yes;?> + <?php echo $gsprache->password;?></option>
                    </select>
                </div>
            </div>
            <div class="Y switch control-group<?php if(isset($errors['keyname'])) echo ' error';?><?php if($publickey=='N') echo ' display_none';?>">
                <label class="control-label" for="inputKeyName"><?php echo $dedicatedLanguage->keyname;?></label>
                <div class="controls"><input id="inputKeyName" class="span11" type="text" name="keyname" maxlength="20" value="<?php echo $keyname;?>"></div>
            </div>
            <div class="N switch control-group<?php if(isset($errors['pass'])) echo ' error';?><?php if($publickey=='Y') echo ' display_none';?>">
                <label class="control-label" for="inputSshPass"><?php echo $dedicatedLanguage->ssh_pass;?></label>
                <div class="controls"><input id="inputSshPass" class="span11" type="password" name="pass" value="<?php echo $pass;?>"></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputftpIP"><?php echo $sprache->ftpIP.' '.$sprache->optional;?></label>
                <div class="controls"><input id="inputftpIP" class="span11" type="text" name="ftpIP" value="<?php echo $ftpIP;?>" maxlength="15" ></div>
            </div>
            <div class="control-group<?php if(isset($errors['ftpPort'])) echo ' error';?>">
                <label class="control-label" for="inputftpPort"><?php echo $sprache->ftpPort;?></label>
                <div class="controls"><input id="inputftpPort" class="span11" type="number" name="ftpPort" value="<?php echo $ftpPort;?>" maxlength="5" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputDesc"><?php echo $dedicatedLanguage->description;?></label>
                <div class="controls"><input id="inputDesc" class="span11" type="text" name="description" value="<?php echo $description;?>"></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputMaxVhost"><?php echo $sprache->maxVhost;?></label>
                <div class="controls"><input id="inputMaxVhost" class="span11" type="number" name="maxVhost" value="<?php echo $maxVhost;?>"></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputMaxHDD"><?php echo $sprache->maxHDD;?></label>
                <div class="controls">
                    <div class="input-append span12">
                        <input id="inputMaxHDD" class="span11" type="number" name="maxHDD" value="<?php echo $maxHDD;?>">
                        <span class="add-on">MB</span>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputDefaultDNS"><?php echo $sprache->defaultdns;?></label>
                <div class="controls"><input id="inputDefaultDNS" class="span11" type="text" name="defaultdns" value="<?php echo $defaultdns;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputUserGroup"><?php echo $sprache->userGroup;?></label>
                <div class="controls"><input id="inputUserGroup" class="span11" type="text" name="userGroup" value="<?php echo $userGroup;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputuserAddCmd"><?php echo $sprache->userAddCmd;?></label>
                <div class="controls"><input id="inputuserAddCmd" class="span11" type="text" name="userAddCmd" value="<?php echo $userAddCmd;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputuserModCmd"><?php echo $sprache->userModCmd;?></label>
                <div class="controls"><input id="inputuserModCmd" class="span11" type="text" name="userModCmd" value="<?php echo $userModCmd;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputuserDelCmd"><?php echo $sprache->userDelCmd;?></label>
                <div class="controls"><input id="inputuserDelCmd" class="span11" type="text" name="userDelCmd" value="<?php echo $userDelCmd;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputhttpdCmd"><?php echo $sprache->httpdCmd;?></label>
                <div class="controls"><input id="inputhttpdCmd" class="span11" type="text" name="httpdCmd" value="<?php echo $httpdCmd;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputVhostStoragePath"><?php echo $sprache->vhostStoragePath;?></label>
                <div class="controls"><input id="inputVhostStoragePath" class="span11" type="text" name="vhostStoragePath" value="<?php echo $vhostStoragePath;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputVhostConfigPath"><?php echo $sprache->vhostConfigPath;?></label>
                <div class="controls"><input id="inputVhostConfigPath" class="span11" type="text" name="vhostConfigPath" value="<?php echo $vhostConfigPath;?>" required></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputvhostTemplate"><?php echo $sprache->vhostTemplate;?></label>
                <div class="controls">
                    <textarea id="inputvhostTemplate" class="span11" name="vhostTemplate" rows="20" required><?php echo $vhostTemplate;?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputQuotaActive"><?php echo $sprache->quotaActive;?></label>
                <div class="controls">
                    <select id="inputQuotaActive" class="span11" name="quotaActive" onchange="SwitchShowHideRows(this.value,'switch2');">
                        <option value="N"><?php echo $gsprache->no;?></option>
                        <option value="Y" <?php if ($quotaActive=='Y') echo 'selected="selected"';?>><?php echo $gsprache->yes;?></option>
                    </select>
                </div>
            </div>
            <div class="Y switch2 control-group<?php if($quotaActive=='N') echo ' display_none';?>">
                <label class="control-label" for="inputQuotaCmd"><?php echo $sprache->quotaCmd;?></label>
                <div class="controls"><input id="inputQuotaCmd" class="span11" type="text" name="quotaCmd" value="<?php echo $quotaCmd;?>"></div>
            </div>
            <div class="N switch2 control-group<?php if($quotaActive=='Y') echo ' display_none';?>">
                <div class="controls alert alert-error"><?php echo $sprache->quotaWarning;?></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEdit"></label>
                <div class="controls">
                    <button class="btn btn-primary" id="inputEdit" type="submit"><i class="icon-plus-sign icon-white"></i> <?php echo $gsprache->add;?></button>
                </div>
            </div>
        </form>
    </div>
</div>