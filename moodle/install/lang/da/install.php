<?php

// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Automatically generated strings for Moodle installer
 *
 * Do not edit this file manually! It contains just a subset of strings
 * needed during the very first steps of installation. This file was
 * generated automatically by export-installer.php (which is part of AMOS
 * {@link http://docs.moodle.org/en/Development:Languages/AMOS}) using the
 * list of strings defined in /install/stringnames.txt.
 *
 * @package   installer
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

$string['admindirname'] = 'Admin-mappe';
$string['availablelangs'] = 'Tilgængelige sprogpakker';
$string['chooselanguagehead'] = 'Vælg et sprog';
$string['chooselanguagesub'] = 'Vælg et sprog til brug under installationen. Dette sprog vil også blive brugt som standardsprog på sitet, men det kan altid ændres til et andet sprog.';
$string['dataroot'] = 'Datamappe';
$string['dbprefix'] = 'Præfix for tabeller';
$string['dirroot'] = 'Moodle-mappe';
$string['environmenthead'] = 'Kontrollerer din serveropsætning...';
$string['installation'] = 'Installation';
$string['langdownloaderror'] = 'Sproget "{$a}" blev desværre ikke installeret. Installationen vil fortsætte på engelsk.';
$string['memorylimithelp'] = '<p>Den mængde hukommelse PHP kan bruge, er sat til {$a}.</p> 

<p>Dette kan forårsage at der opstår problemer senere, især hvis du har mange moduler aktiveret eller mange brugere.</p> 

<p>Vi anbefaler at du konfigurerer PHP med mere hukommelse, f.eks. 40M. 
Der er flere måder hvorpå du kan rette det.</p> 
<ol> 
<li>Hvis du har mulighed for det, kan du rekompilere PHP med <i>--enable-memory-limit</i>. 
Det vil tillade at Moodle selv kan definere hvor meget hukommelse der er brug for.</li> 

<li>Hvis du har adgang til php.ini filen kan du ændre <b>memory_limit</b>-indstillingen til noget i retning af 40M. 
Hvis du ikke har direkte adgang til den kan du bede systemadministratoren om at gøre det for dig.</li> 

<li>På nogle servere kan du oprette en \'.htaccess\' fil og gemme den i moodle-mappen med linjen:
<blockquote><div>php_value memory_limit 40M</div></blockquote> 
<p>Det kan dog på nogle servere forhindre <b>alle</b> PHP-siderne i at virke (du vil se fejl når du ser på siderne). I så fald kan du blive nødt til at fjerne \'.htaccess\' filen igen.</p></li> </ol>';
$string['phpversion'] = 'PHP version';
$string['phpversionhelp'] = '<p>Moodle kræver mindst PHP version 4.3.0. eller 5.1.0 (5.0.x er behæftet med fejl).</p> 
<p>Webserveren bruger i øjeblikket version {$a}</p> 
<p>Du bliver nødt til at opdatere PHP eller flytte systemet over på en anden webserver der har en nyere version af PHP!</p> 
(Har du ver. 5.0.x kan du også nedgradere til 4.4.x)</p>';
$string['welcomep10'] = '{$a->installername} ({$a->installerversion})';
$string['welcomep20'] = 'Du ser denne side fordi du med succes har installeret og åbnet pakken <strong>{$a->packname} {$a->packversion}</strong> på din computer.
Tillykke med det!';
$string['welcomep30'] = 'Denne udgave af <strong>{$a->installername}</strong> indeholder programmerne til at oprette et miljø, hvori <strong>Moodle</strong> vil operere, nemlig:';
$string['welcomep40'] = 'Pakken indeholder også <strong>Moodle {$a->moodlerelease} ({$a->moodleversion})</strong>.';
$string['welcomep50'] = 'Brugen af programmerne i denne pakke er styret af deres respektive licenser. Hele <strong>{$a->installername}</strong>-pakken er <a href="http://www.opensource.org/docs/definition_plain.html">open source</a> og distribueret under <a href="http://www.gnu.org/copyleft/gpl.html">GPL</a>-licensen.';
$string['welcomep60'] = 'De følgende sider vil hjælpe dig gennem nogle nemme trin til konfiguration og opsætning af <strong>Moodle</strong> på din computer. Du kan acceptere standardindstillingerne eller vælge at ændre dem så de bedre svarer til dine egne behov.';
$string['welcomep70'] = 'Klik på "Næste" herunder for at forsætte opsætningen af <strong>Moodle</strong>.';
$string['wwwroot'] = 'Webadresse';
